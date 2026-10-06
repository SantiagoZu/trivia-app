import 'package:flutter/material.dart';

import '../models/pregunta.dart';
import 'result_screen.dart';

/// Pantalla 2: muestra una pregunta con cuatro opciones.
class QuizScreen extends StatefulWidget {
  final Categoria categoria;

  const QuizScreen({super.key, required this.categoria});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _indice = 0; // pregunta actual
  int _correctas = 0;
  int _incorrectas = 0;
  int? _seleccionada; // opción que tocó el usuario (null = aún no responde)

  Pregunta get _pregunta => widget.categoria.preguntas[_indice];
  int get _total => widget.categoria.preguntas.length;

  void _responder(int opcion) {
    if (_seleccionada != null) return; // evita responder dos veces
    setState(() {
      _seleccionada = opcion;
      if (opcion == _pregunta.indiceCorrecto) {
        _correctas++;
      } else {
        _incorrectas++;
      }
    });
  }

  void _siguiente() {
    if (_indice < _total - 1) {
      setState(() {
        _indice++;
        _seleccionada = null;
      });
    } else {
      // pushReplacement: al volver desde resultados no se regresa al quiz terminado
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => ResultScreen(
            categoria: widget.categoria,
            correctas: _correctas,
            incorrectas: _incorrectas,
          ),
        ),
      );
    }
  }

  Color? _colorOpcion(int i) {
    if (_seleccionada == null) return null;
    if (i == _pregunta.indiceCorrecto) return Colors.green;
    if (i == _seleccionada) return Colors.red;
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final esUltima = _indice == _total - 1;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoria.nombre),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Pregunta ${_indice + 1} de $_total',
                textAlign: TextAlign.center),
            const SizedBox(height: 8),
            LinearProgressIndicator(value: (_indice + 1) / _total),
            const SizedBox(height: 32),
            Text(
              _pregunta.texto,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 32),
            // Las cuatro opciones de respuesta
            for (int i = 0; i < _pregunta.opciones.length; i++)
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: _colorOpcion(i),
                    foregroundColor: _colorOpcion(i) != null ? Colors.white : null,
                    textStyle: const TextStyle(fontSize: 18),
                  ),
                  onPressed: () => _responder(i),
                  child: Text(_pregunta.opciones[i]),
                ),
              ),
            const Spacer(),
            // El botón aparece solo después de responder
            if (_seleccionada != null)
              FilledButton(
                style: FilledButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                onPressed: _siguiente,
                child: Text(esUltima ? 'Ver resultados' : 'Siguiente'),
              ),
          ],
        ),
      ),
    );
  }
}
