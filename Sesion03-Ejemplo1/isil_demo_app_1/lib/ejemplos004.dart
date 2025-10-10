class Ejemplos004 {

  void ejecutar() {
    //-- Condicionales if, else, switch
    var edad = 15;
    var esMayorEdad = false;
    if (edad >= 18) {
      esMayorEdad = true;
    } else {
      print("La persona no es mayor de edad, tiene ${edad} años.");
    }
    var nombreDiaDeSemana = '';
    int diaDeSemana = 2;
    switch (diaDeSemana) {
        case 1: 
          nombreDiaDeSemana = 'Lunes';
          print(nombreDiaDeSemana);
        case 2: 
          nombreDiaDeSemana = 'Martes';
          print(nombreDiaDeSemana);
        case 3: 
          nombreDiaDeSemana = 'Miercoles';
          print(nombreDiaDeSemana);
        case 4: 
          nombreDiaDeSemana = 'Jueves';
          print(nombreDiaDeSemana);
        case 5: 
          nombreDiaDeSemana = 'Viernes';
          print(nombreDiaDeSemana);
        case 6: 
          nombreDiaDeSemana = 'Sabado';
          print(nombreDiaDeSemana);
        case 7: 
          nombreDiaDeSemana = 'Domingo';
          print(nombreDiaDeSemana);
      default: nombreDiaDeSemana = 'No existe';
    };
    print('El dia de semana elegido es: ${nombreDiaDeSemana}');
    switch (diaDeSemana) {
      case 1 || 3 || 5 || 7: 
          nombreDiaDeSemana = 'Dia impar';
          print(nombreDiaDeSemana);
      case 2 || 4 || 6: 
          nombreDiaDeSemana = 'Dia par';
          print(nombreDiaDeSemana);
      default: nombreDiaDeSemana = 'No existe';
    };
    print('El dia de semana elegido es: ${nombreDiaDeSemana}');
    //-- Bucles - WHILE
    int contador1 = 11;
    while (contador1 <= 10) {
      print('El valor de mi contador 1 es: ${contador1}');
      contador1++;
    }
    //-- Bucles - DO-WHILE
    int contador2 = 11;
    do {
      print('El valor de mi contador 2 es: ${contador2}');
      contador2++;
    } while (contador2 <= 10);
    //-- Bucles - FOR - Clasico
    for (int i=0; i<10; i++) {
      print('El valor de mi contador FOR 1 es: ${i+1}');
    }
    //-- Bucles - FOR - de Colecciones
    List<String> alumnos1 = [ 'Josue Ramirez', 'Richard Vargas', 'Sebastian Montoya', 'Juan Tovar', 'ISIL 2025', 'Juan Perez', 'Juan Perez', 'Adriana Jimenez', 'Piero Condori' ];
    for (var alumno in alumnos1) {
      print('El alumno de List es: ${alumno}');
    }
    Set<String> alumnos2 = { 'Josue Ramirez', 'Richard Vargas', 'Sebastian Montoya', 'Juan Tovar', 'ISIL 2025', 'Juan Perez', 'Juan Perez', 'Adriana Jimenez', 'Piero Condori', 'Maria Conde', 'Mario Figueroa' };
    for (var alumno in alumnos2) {
      print('El alumno de Set es: ${alumno}');
    }
    //-- Bucles - FOR EACH
    alumnos1.forEach((alumno) {
      print('El alumno dentro de un FOR EACH de List es: ${alumno}');
    });
    //-- Bucles - CONTINUE y BREAK
    int contador4 = 0;
    while (contador4 <= 20) {
      contador4++;
      if (contador4 < 4) continue;
      if (contador4 > 8) break;
      print('El valor de mi contador 4 es: ${contador4}');
    }
  }

}