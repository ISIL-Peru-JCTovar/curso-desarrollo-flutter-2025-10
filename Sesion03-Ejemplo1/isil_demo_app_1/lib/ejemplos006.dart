/* POO en Dart */
class Ejemplos006 {

  void ejecutar() {
    Persona persona1 = Alumno.conCursos("Josue", "Ramirez", 29, [ "Flutter", "Android" ]);
    persona1.imprimirDatos();
    Alumno persona2 = Alumno.conCursos("Richard", "Vargas", 31, [ "Flutter" ]);
    persona2.agregarCurso("IA");
    persona2.imprimirDatos();
  }

}

//-- Clase padre (abstracta), OJO: No todas las clases padre son abstractas
abstract class Persona {
  
  Persona(this.nombres, this.apellidos, this.edad);
  
  int edad = 0;
  String nombres = "";
  String apellidos = "";
  
  void imprimirDatos() {
    print("Nombres: ${nombres}, Apellidos: ${apellidos}, Edad: ${edad}");
  }
  
}

//-- Mixin: Porcion de clase complementaria para gestionar cursos
mixin GestionCursos {
  
  List<String> cursos = [];
  
  void agregarCurso(String curso) {
    cursos.add(curso);
  }
  
  void imprimirCursos() {
    print("Cursos: ${cursos}");
  }
  
}

//-- Mixin: Porcion de clase complementaria para notificaciones
mixin Notificaciones {
  
  void notificar(String mensaje) {
    print("Notificacion: ${mensaje}");
  }
  
}

//-- Herencia (clase hija), con dos Mixins agregados como clases complementos
class Alumno extends Persona with GestionCursos, Notificaciones {
  
  List<String> cursos = [];
  
  //-- Constructor 1
  Alumno(String nombres, String apellidos, int edad):
          super(nombres, apellidos, edad);
  
  //-- Constructor 2
  Alumno.conCursos(String nombres, String apellidos,
                   int edad, List<String> cursos):
          this.cursos = cursos, super(nombres, apellidos, edad);
  
  @override
  void imprimirDatos() {
    super.imprimirDatos();
    super.imprimirCursos();
    /*
    for (var curso in cursos) {
      print("Curso llevando en ISIL: ${curso}");
    }
    */
  }
  
}