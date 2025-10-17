import 'package:isil_flutter_app_202510_1/model/cliente.dart';

class ClienteRepository {

  final List<Cliente> clientes = [
    Cliente(
      nombres: 'Juan',
      apellidos: 'Pérez',
      edad: 30,
      correo: 'juan.perez@gmail.com',
      pais: 'Peru',
      deseaPublicidad: true,
      sexo: 'M',
      nivelSatisfaccion: 4,
      fotoUrl: 'https://randomuser.me/api/portraits/men/1.jpg',
    ),
    Cliente(
      nombres: 'María',
      apellidos: 'Gómez',
      edad: 25,
      correo: 'mgomez@hotmail.com',
      pais: 'Argentina',
      deseaPublicidad: false,
      sexo: 'F',
      nivelSatisfaccion: 5,
      fotoUrl: 'https://randomuser.me/api/portraits/women/1.jpg',
    ),
  ];

  ClienteRepository();

  Cliente find(int index) {
    return clientes[index];
  }

  List<Cliente> findAll() {
    return clientes;
  }

  void add(Cliente cliente) {
    clientes.add(cliente);
  }

  void update(int index, Cliente cliente) {
    if (index >= 0 && index < clientes.length) {
      clientes[index] = cliente;
    }
  }

  void delete(int index) {
    if (index >= 0 && index < clientes.length) {
      clientes.removeAt(index);
    }
  }

}