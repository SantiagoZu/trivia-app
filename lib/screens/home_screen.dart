import 'package:flutter/material.dart';

import '../data/preguntas.dart';
import 'quiz_screen.dart';

/// Pantalla 1: el usuario elige una categoría.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trivia App'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 16),
            const Text(
              'Elige una categoría',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Responde 5 preguntas y mira tu resultado',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            // Un botón por cada categoría del banco de preguntas
            for (final categoria in categorias)
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: FilledButton(
                  style: FilledButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    // push: la pantalla de preguntas se apila sobre la principal
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => QuizScreen(categoria: categoria),
                      ),
                    );
                  },
                  child: Text('${categoria.emoji}  ${categoria.nombre}'),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
