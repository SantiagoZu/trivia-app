/// Una pregunta de la trivia con sus cuatro opciones.
class Pregunta {
  final String texto;
  final List<String> opciones; // siempre 4 opciones
  final int indiceCorrecto; // posición de la respuesta correcta (0 a 3)

  const Pregunta({
    required this.texto,
    required this.opciones,
    required this.indiceCorrecto,
  });
}

/// Una categoría agrupa varias preguntas.
class Categoria {
  final String nombre;
  final String emoji;
  final List<Pregunta> preguntas;

  const Categoria({
    required this.nombre,
    required this.emoji,
    required this.preguntas,
  });
}
