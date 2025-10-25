import 'dart:async';
import 'dart:convert';

import 'package:isil_flutter_app_202510_1/model/cliente.dart';
import 'package:http/http.dart' as http;

class ClienteApiRepository {

  //-- Debe ser la direccion IP de la maquina donde corre el servidor API (no localhost)
  final String baseUrl = 'http://192.168.18.36:3000';

  //-- Timeout de conexion en segundos
  static const int timeoutConexion = 10;
  
  Future<List<Cliente>> findAll() async {
    Uri url = Uri.parse('$baseUrl/clientes');
    try {    
      final response = await http.get(url)
                                 .timeout(const Duration(seconds: timeoutConexion));
      if (response.statusCode == 200) {
        final List<dynamic> body = jsonDecode(response.body);
        return body.map((json) => Cliente.fromMap(json)).toList();
      } else {
        throw Exception('Error al cargar los clientes');
      }
    } on TimeoutException catch (_) {
      throw Exception('Tiempo de espera excedido. No se pudo conectar.');
    } catch (e) {
      throw Exception('Error desconocido: $e');
    }
  }

  Future<Cliente> find(int id) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/clientes/$id'))
                                 .timeout(const Duration(seconds: timeoutConexion));
      if (response.statusCode == 200) {
        return Cliente.fromMap(jsonDecode(response.body));
      } else {
        throw Exception('Error al cargar el cliente');
      }
    } on TimeoutException catch (_) {
      throw Exception('Tiempo de espera excedido. No se pudo conectar.');
    } catch (e) {
      throw Exception('Error desconocido: $e');
    }
  }

  Future<Cliente> add(Cliente cliente) async {
    try {
      Map<String, dynamic> clienteMap = cliente.id > 0 ? cliente.toMap() : cliente.toMapInsert();
      final response = await http.post(
                                Uri.parse('$baseUrl/clientes'),
                                headers: {'Content-Type': 'application/json'},
                                body: jsonEncode(clienteMap),
                              ).timeout(const Duration(seconds: timeoutConexion));
      if (response.statusCode == 201) {
        return Cliente.fromMap(jsonDecode(response.body));
      } else {
        throw Exception('Error al agregar el cliente');
      }
    } on TimeoutException catch (_) {
      throw Exception('Tiempo de espera excedido. No se pudo conectar.');
    } catch (e) {
      throw Exception('Error desconocido: $e');
    }
  }

  Future<Cliente> update(int id, Cliente cliente) async {
    try {
      final response = await http.put(
                                Uri.parse('$baseUrl/clientes/$id'),
                                headers: {'Content-Type': 'application/json'},
                                body: jsonEncode(cliente.toMap()),
                              ).timeout(const Duration(seconds: timeoutConexion));
      if (response.statusCode == 200) {
        return Cliente.fromMap(jsonDecode(response.body));
      } else {
        throw Exception('Error al actualizar el cliente');
      }
    } on TimeoutException catch (_) {
      throw Exception('Tiempo de espera excedido. No se pudo conectar.');
    } catch (e) {
      throw Exception('Error desconocido: $e');
    }
  }

  Future<void> delete(int id) async {
    try {
      final response = await http.delete(Uri.parse('$baseUrl/clientes/$id'))
                                 .timeout(const Duration(seconds: timeoutConexion));
      if (response.statusCode != 200) {
        throw Exception('Error al eliminar el cliente');
      }
    } on TimeoutException catch (_) {
      throw Exception('Tiempo de espera excedido. No se pudo conectar.');
    } catch (e) {
      throw Exception('Error desconocido: $e');
    }  
  }

}