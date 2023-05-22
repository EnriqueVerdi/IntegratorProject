class Tarea {
  final int id;
  final String titulo;
  final String descripcion;
  final int estado;

  Tarea({
    required this.id,
    required this.titulo,
    required this.descripcion,
    required this.estado,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'titulo': titulo,
      'descripcion': descripcion,
      'estado': estado
    };
  }

  static Tarea fromMap(Map<String, dynamic> map) {
    return Tarea(
      id: map['id'],
      titulo: map['titulo'],
      descripcion: map['descripcion'],
      estado: map['estado'],
    );
  }
}
