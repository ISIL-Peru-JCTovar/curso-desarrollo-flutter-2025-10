import 'package:flutter/material.dart';
import 'package:isil_flutter_app_202510_1/model/cliente.dart';
import 'package:isil_flutter_app_202510_1/repositories/clienterepository.dart';

//Pantalla de lista de clientes

class ClienteListScreen extends StatefulWidget {

  @override
  State<ClienteListScreen> createState() => _ClienteListScreenState();
  
}

class _ClienteListScreenState extends State<ClienteListScreen> {

  ClienteRepository clienteRepository = ClienteRepository();
  double _scale = 1.5;
  double _previousScale = 1.5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ISIL-CRM: Lista Clientes'),
      ),
      body: Column(
        children: [
          //-- Encabezado de la lista
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                // Acción al tocar el encabezado (opcional)
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Encabezado de la lista tocado')),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.blue.shade100,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Center(
                  child: Text('Lista de Clientes (tap aqui interactivo)'),
                ),
              ),
            ),
          ),
          //-- La lista expandida
          Expanded(
            child: ListView.builder(
                      itemCount: clienteRepository.findAll().length,
                      itemBuilder: (context, index) {
                        final cliente = clienteRepository.findAll()[index];
                        return ListTile(
                          leading: GestureDetector(
                                    onScaleStart: (details) {
                                      _previousScale: _scale;
                                    },
                                    onScaleUpdate: (details) {
                                      setState(() {
                                        _scale = _previousScale * details.scale;
                                      });
                                    },
                                    onScaleEnd: (details) {
                                      _scale = 1.0;
                                      _previousScale = 1.0;
                                    },
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (_) => AlertDialog(
                                          title: Text('Foto de ${cliente.nombres}'),
                                          content: Image.network(
                                            cliente.fotoUrl,
                                            width: 300,
                                            height: 300,
                                            fit: BoxFit.cover,
                                          ),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.of(context).pop(),
                                              child: Text('Cerrar'),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                   child: Transform.scale(
                                    scale: _scale,
                                    child:  CircleAvatar(
                                              backgroundImage: NetworkImage(cliente.fotoUrl),
                                            ),
                                   ),
                                 ),
                          title: Text('${cliente.nombres} ${cliente.apellidos}'),
                          subtitle: Text(cliente.correo),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: Icon(Icons.edit),
                                tooltip: 'Editar',
                                onPressed: () {
                                  // Editar el cliente (implementar lógica)
                                  _irAFormulario('editar', cliente: cliente, indice: index);
                                },
                              ),
                              IconButton(
                                icon: Icon(Icons.delete),
                                tooltip: 'Eliminar',
                                onPressed: () {
                                  // Eliminar el cliente (implementar lógica)
                                  _eliminarClienteConConfirmacion(index);
                                },
                              ),
                            ],
                          ),
                          onTap: () {
                            // Navegar a la pantalla de detalles del cliente
                            // Navigator.pushNamed(context, '/detalles', arguments: cliente);
                          },
                        );
                      },
                    ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navegar a la pantalla de creación de nuevo cliente
          _irAFormulario('crear');
        },
        tooltip: 'Agregar Cliente',
        child: Icon(Icons.add),
      ),
    );
  }
  
  void _irAFormulario(String metodo, { Cliente? cliente, int? indice }) {
    //Navigator.pushNamed(context, '/crear'); //NO
    Navigator.pushNamed(
        context, 
        '/${metodo}',
        arguments: cliente != null ? {'cliente': cliente, 'indice': indice} : null,
      ).then((resultado) {
      if (resultado != null && resultado is Map) {
        Cliente clienteDeForm = resultado['cliente'];
        int? indice = resultado['indice'];
        if (clienteDeForm != null) {
          setState(() {
            if (indice != null) {
              //Editar
              clienteRepository.update(indice, clienteDeForm);
            } else {
              //Crear
              clienteRepository.add(clienteDeForm);
            }
          });
        }
      }
    });
  }

  Future<bool?> _mostrarConfirmacionEliminar(BuildContext context, Cliente c) {
    return showDialog<bool>(
      context: context,
      builder: (BuildContext ctx) {
        return AlertDialog(
          title: Text('Confirmar eliminación'),
          content: Text('¿Estás seguro de que deseas eliminar a ${c.nombres} ${c.apellidos}?'),
          actions: [
            TextButton(
              child: Text('Cancelar'),
              onPressed: () {
                Navigator.of(ctx).pop(false);
              },
            ),
            TextButton(
              child: Text('Eliminar', style: TextStyle(color: Colors.red)),
              onPressed: () {
                Navigator.of(ctx).pop(true);
              },
            ),
          ],
        );
      },
    );
  }

  void _eliminarClienteConConfirmacion(int index) async {
    final cliente = clienteRepository.find(index);
    final confirmado = await _mostrarConfirmacionEliminar(context, cliente);
    if (confirmado == true) {
      setState(() {
        clienteRepository.delete(index);
      });
      // Opcional: mostrar Snackbar o Toast de “Cliente eliminado”
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Cliente eliminado')),
      );
    }
  }

}