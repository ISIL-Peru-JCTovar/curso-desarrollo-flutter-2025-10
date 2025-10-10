class Ejemplos001 {

  void ejecutar() {
    //-- Definicion de tipos de variables int y String (sin var y con var)
    int edad1 = 30;
    var edad2 = 30;
    var edad3 = '30';
    String edad4 = '30';
    print('La edad N° 1 es: ${edad1}');
    print('La edad N° 2 es: ${edad2}');
    print('La suma de la edad N° 1 y N° 2 es: ${edad1 + edad2}');
    print('La suma de la edad N° 3 y N° 4 es: ${edad3 + edad4}');
    //print('La suma de la edad N° 1 y N° 3 es: ${edad1 + edad3}'); //No se puede
    //-- Definiciones de double y bool
    double sueldo1 = 3586.98;
    print('El sueldo es: ${sueldo1}');
    bool esSueldoMinimo = true;
    esSueldoMinimo = (sueldo1 <= 1100);
    print("El sueldo ${sueldo1} es sueldo minimo?: ${esSueldoMinimo}");
    //final y late final
    final double IGV = 0.18;
    print('El % de impuesto a las ventas es: ${IGV*100}%');
    late final String CODIGO_PERU;
    //print('El codigo de Peru es: ${CODIGO_PERU}');
    if (esSueldoMinimo) {
      CODIGO_PERU = 'PE1';
    } else {
      CODIGO_PERU = 'PE2';
    }
    print('El codigo de Peru es: ${CODIGO_PERU}');
    //Null Safety
    String cadNumGolesRealizados1 = '15';
    int? numGoles1 = int.tryParse(cadNumGolesRealizados1);
    String cadNumGolesRealizados2 = 'ABC';
    int? numGoles2 = int.tryParse(cadNumGolesRealizados2);
    print("Numero de goles 1: ${numGoles1 ?? 0}");   //15
    print("Numero de goles 2: ${numGoles2 ?? 0}");   //0
    //Tipo de dato dynamic
    dynamic jugador1 = "Cristiano Ronaldo";
    print(jugador1);
    jugador1 = true;
    print(jugador1);
    jugador1 = 33;
    print(jugador1);
    jugador1 = [ 'Lionel Messi', 'Cristiano Ronaldo', 'Lamine Yamal' ];
    print(jugador1);
  }


}

