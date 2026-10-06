import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:trivia_app/main.dart';

void main() {
  testWidgets('La pantalla principal muestra las categorías', (tester) async {
    await tester.pumpWidget(const TriviaApp());
    expect(find.text('Elige una categoría'), findsOneWidget);
    expect(find.textContaining('Historia'), findsOneWidget);
    expect(find.textContaining('Ciencia'), findsOneWidget);
    expect(find.textContaining('Deportes'), findsOneWidget);
  });

  testWidgets('Flujo completo: categoría -> preguntas -> resultados', (tester) async {
    await tester.pumpWidget(const TriviaApp());
    await tester.tap(find.textContaining('Ciencia'));
    await tester.pumpAndSettle();
    expect(find.text('Pregunta 1 de 5'), findsOneWidget);

    for (int i = 0; i < 5; i++) {
      // toca la primera opción de cada pregunta y avanza
      final opciones = find.byType(OutlinedButton);
      await tester.tap(opciones.first);
      await tester.pump();
      await tester.tap(find.text(i < 4 ? 'Siguiente' : 'Ver resultados'));
      await tester.pumpAndSettle();
    }
    expect(find.text('Resultados'), findsOneWidget);
    expect(find.text('Correctas'), findsOneWidget);
    expect(find.text('Incorrectas'), findsOneWidget);
  });
}
