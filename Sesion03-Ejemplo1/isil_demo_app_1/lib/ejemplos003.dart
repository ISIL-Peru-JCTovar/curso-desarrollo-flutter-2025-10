class Ejemplos003 {

  void ejecutar() {
    //-- Definicion de operadores aritmeticos
    int sumaEdades1 = 31 + 35 + 37 + 40 + 33;
    print('La suma de edades es: ${sumaEdades1}');
    double promedioEdades1 = sumaEdades1 / 5;
    print('El promedio de edades (con decimales) es: ${promedioEdades1}');
    int promedioEdades2 = sumaEdades1 ~/ 5;
    print('El promedio de edades (solo entero) es: ${promedioEdades2}');
    int residuoEdades = sumaEdades1 % 5;
    print('El residuo de edades es: ${residuoEdades}');
    //-- Definicion de operadores relacionales
    print(promedioEdades1 == promedioEdades2);
    print(promedioEdades1 >= promedioEdades2);
    print(promedioEdades1 <= promedioEdades2);
    print(promedioEdades1 != promedioEdades2);
    print(promedioEdades1 > promedioEdades2);
    print(promedioEdades1 < promedioEdades2);
    //-- Definicion de asignacion condicional (Null Safety)
    int? valor1 = int.tryParse('15');
    int valor1Final = valor1 ?? 0;
    print("El valor final es: ${valor1Final}");
  }


}