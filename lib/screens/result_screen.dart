import 'package:flutter/material.dart';

import '../models/pregunta.dart';
import 'quiz_screen.dart';

/// Pantalla 3: muestra respuestas correctas e incorrectas.
class ResultScreen extends StatelessWidget {
  final Categoria categoria;
  final int correctas;
  final int incorrectas;

  const ResultScreen({
    super.key,
    required this.categoria,
    required this.correctas,
    required this.incorrectas,
  });

  @override
  Widget build(BuildContext context) {
    final total = correctas + incorrectas;
    final mensaje = correctas == total
        ? '¡Perfecto!'
        : correctas >= total / 2
            ? '¡Bien hecho!'
            : 'Sigue practicando';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Resultados'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 16),
            Text(
              mensaje,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text('Categoría: ${categoria.nombre}', textAlign: TextAlign.center),
            const SizedBox(height: 32),
            _Tarjeta(
              titulo: 'Correctas',
              valor: correctas,
              color: Colors.green,
              icono: Icons.check_circle,
            ),
            const SizedBox(height: 16),
            _Tarjeta(
              titulo: 'Incorrectas',
              valor: incorrectas,
              color: Colors.red,
              icono: Icons.cancel,
            ),
            const Spacer(),
            FilledButton.icon(
              style: FilledButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              icon: const Icon(Icons.replay),
              label: const Text('Jugar de nuevo'),
              onPressed: () {
                // Reemplaza resultados por un quiz nuevo de la misma categoría
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => QuizScreen(categoria: categoria),
                  ),
                );
              },
            ),
            const SizedBox(height: 12),
            OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              icon: const Icon(Icons.home),
              label: const Text('Volver al inicio'),
              onPressed: () {
                // Cierra todas las pantallas hasta llegar a la principal
                Navigator.popUntil(context, (route) => route.isFirst);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _Tarjeta extends StatelessWidget {
  final String titulo;
  final int valor;
  final Color color;
  final IconData icono;

  const _Tarjeta({
    required this.titulo,
    required this.valor,
    required this.color,
    required this.icono,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(icono, color: color, size: 40),
        title: Text(titulo, style: const TextStyle(fontSize: 20)),
        trailing: Text(
          '$valor',
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: color),
        ),
      ),
    );
  }
}
