class Ejemplos005 {

  void ejecutar() {
    //-- 1. Funciones normales
    int resultado1 = sumar(5, 10);
    print('La suma es: ${sumar(5, 10)}');
    //-- 2. Funciones sin retorno (no se pueden colocar como parte de una expresion)
    imprimirSuma(15, 14);
    //-- 3. Funciones con parametros opcionales
    int resultado2 = sumarConParametrosOpc(20, 24);
    int resultado3 = sumarConParametrosOpc(20, 24, 11);
    print('El resultado de la suma de 20 y 24 es: ${resultado2}');
    print('El resultado de la suma de 20, 24 y 11 es: ${resultado3}');
    //-- 4. Funciones con parametros nombrados
    bool esLogueado1 = validarUsuarioClave(usuario: "usil", clave: "123");
    print('1: El usuario usil se autentico al sistema?: ${esLogueado1}');
    bool esLogueado2 = validarUsuarioClave(clave: "456", usuario: "usil");
    print('2: El usuario usil se autentico al sistema?: ${esLogueado2}');
    bool esLogueado3 = validarUsuarioClave(usuario: "isil", clave: "1234");
    print('3: El usuario isil se autentico al sistema?: ${esLogueado3}');
    bool esLogueado4 = validarUsuarioClave(clave: "1234", usuario: "isil");
    print('4: El usuario isil se autentico al sistema?: ${esLogueado4}');
    //-- 5. Funciones con valores por defecto
    imprimirDatosAlumno('Richard Vargas', 33, 'USIL');
    imprimirDatosAlumno('Josue Ramirez', 31);
    imprimirDatosAlumno('Sebastian Montoya', 30);
    //-- 6. Funciones de una sola linea
    print("La multiplicacion de 5, 6 y 7 es: ${multiplicarNums(5, 6, 7)}");
    //-- 7. Funciones anonimas
    var listaNums = [ 4, 5, 6, 7];
    var cuadradosNums = listaNums.map((n) => n*n).toList();
    print(listaNums);
    print(cuadradosNums);
  }

  //-- Funciones: 1. Funcion normal
  int sumar(int val1, int val2) {
    int sumaTotal = val1 + val2;
    return sumaTotal;
  }

  //-- Funciones: 2. Funciones sin retorno (void)
  void imprimirSuma(int val1, int val2) {
    int sumaTotal = val1 + val2;
    print('La suma total dentro de la funcion es: ${sumaTotal}');
  }

  //-- Funciones: 3. Funcion con parametros opcionales
  int sumarConParametrosOpc(int val1, int val2, [int? val3]) {
    int sumaTotal = val1 + val2 + (val3 ?? 0);
    return sumaTotal;
  }

  //-- Funciones: 4. Funcion con parametros nombrados
  bool validarUsuarioClave({required String usuario, required String clave}) {
    if (usuario == "isil" && clave == "1234") {
      print('Acceso exitoso al sistema');
      return true;
    }
    print('Usuario y clave incorrecto');
    return false;
  }

  //-- Funciones: 5. Funciones con valores por defecto
  void imprimirDatosAlumno(String nombre, int edad, [String institucion = 'ISIL']) {
    print("El alumno es: ${nombre}, tiene ${edad} años y estudia en ${institucion}");
  }

  //-- Funciones: 6. Funciones cortas (de una sola linea)
  int multiplicarNums(int num1, int num2, int num3) => num1 * num2 * num3;

}