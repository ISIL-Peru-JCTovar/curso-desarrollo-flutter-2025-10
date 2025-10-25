class Cliente {

  int id;
  String nombres;
  String apellidos;
  int edad;
  String correo;
  String pais;
  bool deseaPublicidad;
  String sexo;
  double nivelSatisfaccion;
  String fotoUrl;
  String? fotoPath;

  Cliente({
    required this.id,
    required this.nombres,
    required this.apellidos,
    required this.edad,
    required this.correo,
    required this.pais,
    required this.deseaPublicidad,
    required this.sexo,
    required this.nivelSatisfaccion,
    required this.fotoUrl,
    required this.fotoPath,
  });

  factory Cliente.fromMap(Map<String, dynamic> map) {
    Cliente cliente = Cliente(
      id: (map['id'] is int) ? map['id'] : int.parse(map['id'].toString()),
      nombres: map['nombres'] ?? '',
      apellidos: map['apellidos'] ?? '',
      edad: (map['edad'] is int) ? map['edad'] : int.parse(map['edad'].toString()),
      correo: map['correo'] ?? '',
      pais: map['pais'] ?? '',
      deseaPublicidad: (map['deseaPublicidad'].toString().toLowerCase() == 'true'),
      sexo: map['sexo'] ?? '',
      nivelSatisfaccion: double.tryParse(map['nivelSatisfaccion'].toString()) ?? 0.0,
      fotoUrl: map['fotoUrl'] ?? '',
      fotoPath: map['fotoPath'] ?? '',
    );
    return cliente;
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'id': id,
      'nombres': nombres,
      'apellidos': apellidos,
      'edad': edad,
      'correo': correo,
      'pais': pais,
      'deseaPublicidad': deseaPublicidad,
      'sexo': sexo,
      'nivelSatisfaccion': nivelSatisfaccion,
      'fotoUrl': fotoUrl,
      'fotoPath': fotoPath,
    };
    return map;
  }

  Map<String, dynamic> toMapInsert() {
    Map<String, dynamic> map = {
      'nombres': nombres,
      'apellidos': apellidos,
      'edad': edad,
      'correo': correo,
      'pais': pais,
      'deseaPublicidad': deseaPublicidad,
      'sexo': sexo,
      'nivelSatisfaccion': nivelSatisfaccion,
      'fotoUrl': fotoUrl,
      'fotoPath': fotoPath,
    };
    return map;
  }

}