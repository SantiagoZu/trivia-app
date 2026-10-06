import '../models/pregunta.dart';

/// Banco de preguntas. Para agregar una categoría basta con añadir
/// un nuevo objeto Categoria a esta lista.
const List<Categoria> categorias = [
  Categoria(
    nombre: 'Historia',
    emoji: '🏛️',
    preguntas: [
      Pregunta(
        texto: '¿En qué año llegó Cristóbal Colón a América?',
        opciones: ['1492', '1500', '1453', '1519'],
        indiceCorrecto: 0,
      ),
      Pregunta(
        texto: '¿En qué fecha se celebra la independencia de Colombia?',
        opciones: ['7 de agosto', '20 de julio', '12 de octubre', '1 de mayo'],
        indiceCorrecto: 1,
      ),
      Pregunta(
        texto: '¿Quién fue el primer presidente de Estados Unidos?',
        opciones: ['Abraham Lincoln', 'Thomas Jefferson', 'George Washington', 'John Adams'],
        indiceCorrecto: 2,
      ),
      Pregunta(
        texto: '¿En qué año cayó el Muro de Berlín?',
        opciones: ['1985', '1991', '1979', '1989'],
        indiceCorrecto: 3,
      ),
      Pregunta(
        texto: '¿Qué civilización construyó Machu Picchu?',
        opciones: ['Inca', 'Maya', 'Azteca', 'Muisca'],
        indiceCorrecto: 0,
      ),
    ],
  ),
  Categoria(
    nombre: 'Ciencia',
    emoji: '🔬',
    preguntas: [
      Pregunta(
        texto: '¿Cuál es el símbolo químico del oro?',
        opciones: ['Ag', 'Au', 'Or', 'Go'],
        indiceCorrecto: 1,
      ),
      Pregunta(
        texto: '¿Cuál es el planeta más grande del sistema solar?',
        opciones: ['Saturno', 'Tierra', 'Júpiter', 'Neptuno'],
        indiceCorrecto: 2,
      ),
      Pregunta(
        texto: '¿Qué gas absorben las plantas en la fotosíntesis?',
        opciones: ['Oxígeno', 'Nitrógeno', 'Hidrógeno', 'Dióxido de carbono'],
        indiceCorrecto: 3,
      ),
      Pregunta(
        texto: '¿Cuántos huesos tiene el cuerpo humano adulto?',
        opciones: ['206', '180', '250', '312'],
        indiceCorrecto: 0,
      ),
      Pregunta(
        texto: '¿A qué temperatura hierve el agua a nivel del mar?',
        opciones: ['90 °C', '100 °C', '110 °C', '120 °C'],
        indiceCorrecto: 1,
      ),
    ],
  ),
  Categoria(
    nombre: 'Deportes',
    emoji: '⚽',
    preguntas: [
      Pregunta(
        texto: '¿Cuántos jugadores tiene un equipo de fútbol en la cancha?',
        opciones: ['9', '10', '11', '12'],
        indiceCorrecto: 2,
      ),
      Pregunta(
        texto: '¿Qué país ganó el Mundial de Fútbol de 2022?',
        opciones: ['Francia', 'Brasil', 'Croacia', 'Argentina'],
        indiceCorrecto: 3,
      ),
      Pregunta(
        texto: '¿Cada cuántos años se celebran los Juegos Olímpicos de verano?',
        opciones: ['4', '2', '3', '5'],
        indiceCorrecto: 0,
      ),
      Pregunta(
        texto: '¿En qué deporte se usa el término "home run"?',
        opciones: ['Tenis', 'Béisbol', 'Golf', 'Baloncesto'],
        indiceCorrecto: 1,
      ),
      Pregunta(
        texto: '¿Cuántos puntos vale un tiro desde fuera de la línea de tres en baloncesto?',
        opciones: ['1', '2', '3', '4'],
        indiceCorrecto: 2,
      ),
    ],
  ),
];
