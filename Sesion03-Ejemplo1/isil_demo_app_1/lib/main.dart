import 'package:isil_demo_app_1/ejemplos001.dart';
import 'package:isil_demo_app_1/ejemplos002.dart';
import 'package:isil_demo_app_1/ejemplos003.dart';
import 'package:isil_demo_app_1/ejemplos004.dart';
import 'package:isil_demo_app_1/ejemplos005.dart';

void main() {
  //-- Ejemplos N° 1: Tipos de datos y Null Safety
  Ejemplos001 ejemplos1 = Ejemplos001();
  ejemplos1.ejecutar();
  //-- Ejemplos N° 2: Listas y Mapas (List, Set, Map)
  Ejemplos002 ejemplos2 = Ejemplos002();
  ejemplos2.ejecutar();
  //-- Ejemplos N° 3: Operadores Aritmeticos, Relacionales
  Ejemplos003 ejemplos3 = Ejemplos003();
  ejemplos3.ejecutar();
  //-- Ejemplos N° 4: Control de flujo (if, switch, for, while, do-while)
  Ejemplos004 ejemplos4 = Ejemplos004();
  ejemplos4.ejecutar();
  //-- Ejemplos N° 5: Uso de funciones
  Ejemplos005 ejemplos5 = Ejemplos005();
  ejemplos5.ejecutar();
}

