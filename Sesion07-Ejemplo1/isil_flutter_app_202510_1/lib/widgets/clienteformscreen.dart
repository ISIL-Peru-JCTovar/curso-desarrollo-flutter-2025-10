import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:isil_flutter_app_202510_1/model/cliente.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

class ClienteFormScreen extends StatefulWidget {
  
  @override
  State<ClienteFormScreen> createState() => _ClienteFormScreenState();

}

class _ClienteFormScreenState extends State<ClienteFormScreen> {

  final _formKey = GlobalKey<FormState>();

  //-- Definir controladores para los campos del formulario (por implementar)
  late TextEditingController _nombresController;
  late TextEditingController _apellidosController;
  late TextEditingController _edadController;
  late TextEditingController _correoController;

  int _id = 0;
  String _pais = 'Peru';
  bool _deseaPublicidad = false;
  String _sexo = 'M';
  double _nivelSatisfaccion = 3;
  String _fotoUrl = 'https://randomuser.me/api/portraits/men/90.jpg';

  bool _esEditable = false;
  int? _indiceEditable;
  
  final List<String> _paises = [
    'Peru',
    'Argentina',
    'Chile',
    'Colombia',
    'Brasil',
    'Mexico',
    'Rusia',
    'Estados Unidos',
    'Canada',
    'España',
    'Francia',
    'Alemania',
    ];  

  //-- Variables para manejo de imagen (por implementar)
  final ImagePicker _picker = ImagePicker();
  String? _fotoPath;

  //-- Funcion para elegir foto (por implementar)
  Future<void> _elegirFoto() async {
    final XFile? imagen = await _picker.pickImage(source: ImageSource.gallery);
    //final XFile? imagen = await _picker.pickImage(source: ImageSource.camera);
    //-- ** El usuario puede cancelar la selección de imagen
    if (imagen == null) {
      return;
    }
    final String newPath = await _guardarImagenPermanentemente(imagen);
    setState(() {
      _fotoPath = newPath;
      _fotoUrl = newPath;
    });
  }

  //-- Funcion para guardar imagen permanentemente (por implementar)
  Future<String> _guardarImagenPermanentemente(XFile imagen) async {
    final Directory appDocDir = await getApplicationDocumentsDirectory();
    final String appDocPath = appDocDir.path;
    final String fileName = path.basename(imagen.path);
    final String localPath = path.join(appDocPath, fileName);
    final File newImage = await File(imagen.path).copy(localPath);
    return newImage.path;
  }

  @override
  void initState() {
    super.initState();
    _nombresController = TextEditingController();
    _apellidosController = TextEditingController();
    _edadController = TextEditingController();
    _correoController = TextEditingController();
    //En caso de editar, cargar datos del cliente
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      final args = ModalRoute.of(context)?.settings.arguments;
      if (args != null && args is Map<String, dynamic> && args.containsKey('cliente')) {
        final Cliente cliente = args['cliente'];
        _id = cliente.id;
        _nombresController.text = cliente.nombres;
        _apellidosController.text = cliente.apellidos;
        _edadController.text = cliente.edad.toString();
        _correoController.text = cliente.correo;
        _pais = cliente.pais;
        _deseaPublicidad = cliente.deseaPublicidad;
        _sexo = cliente.sexo;
        _nivelSatisfaccion = cliente.nivelSatisfaccion;
        _fotoUrl = cliente.fotoUrl;
        _fotoPath = cliente.fotoPath;
        _esEditable = true;
        _indiceEditable = args['indice'];
        setState(() {});
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_esEditable ? 'ISIL-CRM: Editar Cliente' : 'ISIL-CRM: Crear Cliente'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  controller: _nombresController,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.person),
                    hintText: 'Ingrese los nombres',
                    labelText: 'Nombres *',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingrese los nombres';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _apellidosController,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.person),
                    hintText: 'Ingrese los apellidos',
                    labelText: 'Apellidos *',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingrese los apellidos';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _edadController,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.cake),
                    hintText: 'Ingrese la edad',
                    labelText: 'Edad *',
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingrese la edad';
                    }
                    final edad = int.tryParse(value);
                    if (edad == null || edad <= 0) {
                      return 'Por favor ingrese una edad válida';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _correoController,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.email),
                    hintText: 'Ingrese el correo electrónico',
                    labelText: 'Correo *',
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingrese el correo electrónico';
                    }
                    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return 'Por favor ingrese un correo electrónico válido';
                    }
                    return null;
                  },
                ),
                DropdownButtonFormField<String>(
                  value: _pais,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.map),
                    labelText: 'País',
                  ),
                  items: _paises.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _pais = newValue!;
                    });
                  },
                ),
                Row(
                  children: [
                    /*
                    Checkbox(
                      value: _deseaPublicidad,
                      onChanged: (valor) {
                        if (valor != null) {
                          setState(() {
                            _deseaPublicidad = valor;
                          });
                        }
                      }),
                    */
                    Switch(
                      value: _deseaPublicidad, 
                      onChanged: (nuevo) {
                        setState(() {
                          _deseaPublicidad = nuevo;
                        });
                      }
                    ),
                    const Text('Desea recibir publicidad'),
                  ],
                ),
                Text('Sexo'),
                Row(
                  children: [
                    Radio<String>(
                      value: 'M',
                      groupValue: _sexo,
                      onChanged: (String? value) {
                        if (value != null) {
                          setState(() {
                            _sexo = value;
                          });
                        }
                      },
                    ),
                    const Text('Masculino'),
                    Radio<String>(
                      value: 'F',
                      groupValue: _sexo,
                      onChanged: (String? value) {
                        if (value != null) {
                          setState(() {
                            _sexo = value;
                          });
                        }
                      },
                    ),
                    const Text('Femenino'),
                  ],
                ),
                Center(
                  child: Column(
                    children: [ 
                      Text('Foto del cliente:'),
                      SizedBox(height: 8),
                      if (_fotoPath != null)
                        Image.file(
                          File(_fotoPath!),
                          height: 150,
                          width: 150,
                          fit: BoxFit.cover,
                        )
                      else
                        Placeholder(
                          fallbackHeight: 150,
                          fallbackWidth: 150,
                        ),
                      SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: () {
                          _elegirFoto();
                        },
                        child: const Text('Cambiar Foto'),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      _guardarCliente();
                    },
                    child: const Text('Guardar'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  
  void _guardarCliente() {
    // Validate returns true if the form is valid, or false otherwise.
    if (_formKey.currentState!.validate()) {
      Cliente nuevo = Cliente(
        id: _id,
        nombres: _nombresController.text,
        apellidos: _apellidosController.text,
        edad: int.parse(_edadController.text),
        correo: _correoController.text,
        pais: _pais,
        deseaPublicidad: _deseaPublicidad,
        sexo: _sexo,
        nivelSatisfaccion: _nivelSatisfaccion,
        fotoUrl: _fotoUrl,
        fotoPath: _fotoPath,
      );
      Navigator.pop(context, {
        'cliente': nuevo,
        'id': _esEditable ? _id : null,
      });
    }
  }

}