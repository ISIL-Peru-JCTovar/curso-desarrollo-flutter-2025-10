import 'dart:collection';

class Ejemplos002 {

  void ejecutar() {
    //-- Definicion de listas (List) - Duplicados
    List<String> alumnos1 = [ 'Josue Ramirez', 'Richard Vargas', 'Sebastian Montoya', 'Juan Tovar', 'ISIL 2025', 'Juan Perez', 'Juan Perez', 'Adriana Jimenez', 'Piero Condori' ];
    print('Alumnos 1 - List:');
    print(alumnos1);
    print('');
    //-- Definicion de listas (Set) - No duplicados
    //-- ** Inicializados con llave - Utiliza la clase LinkedHashSet (ordenado)
    Set<String> alumnos2 = { 'Josue Ramirez', 'Richard Vargas', 'Sebastian Montoya', 'Juan Tovar', 'ISIL 2025', 'Juan Perez', 'Juan Perez', 'Adriana Jimenez', 'Piero Condori', 'Maria Conde', 'Mario Figueroa' };
    print('Alumnos 2 - Set (LinkedHashSet):');
    print(alumnos2);
    print('');
    //-- ** Inicializacion con HashSet (no necesariamente ordenado)
    Set<String> alumnos3 = HashSet<String>();
    for (var al2 in alumnos2) {
      alumnos3.add(al2);
    }
    print('Alumnos 3 - Set (HashSet):');
    print(alumnos3);
    print('');
    //-- Definicion de listas (Map) - Clave (key) vs Valor (value)
    Map<String, int> alumnos4 = {
      'Josue Ramirez': 31,
      'Richard Vargas': 33,
      'Sebastian Montoya': 29,
      'Juan Tovar': 40
    };
    print('Alumnos 4 - Map:');
    print(alumnos4);
    print('');
  }

}