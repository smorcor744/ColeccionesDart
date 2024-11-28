import 'dart:io';

void main() {
  GestorCalificaciones gestor = GestorCalificaciones();
  bool seguir = true;

  // Se encarga de el manejo de las entradas del ususario
  while (seguir) {
    stdout.write('Introduce la acción a realizar: x para salir, a para agregar una calificación, q para quitar una calificación, v para ver todas las calificaciones: ');
    String? opcion = stdin.readLineSync();

    // Para salir del bucle
    if (opcion != null && opcion == "x") {
      seguir = false;

      // Para añadir
    } else if (opcion != null && opcion == "a") {
      stdout.write('Introduce el nombre del estudiante: ');
      String? nombre = stdin.readLineSync();
      stdout.write('Introduce la calificación del estudiante: ');
      String? calificacionStr = stdin.readLineSync();

      // Comprovaciones
      if (nombre != null && nombre.isNotEmpty && calificacionStr != null && calificacionStr.isNotEmpty) {
        try {
          double calificacion = double.parse(calificacionStr);
          gestor.add(nombre, calificacion);
        } catch (e) {
          print('Calificación inválida. Por favor, introduce un número.');
        }
      }

      // Para quitar
    } else if (opcion != null && opcion == "q") {
      stdout.write('Introduce el nombre del estudiante cuya calificación quieres quitar: ');
      String? nombre = stdin.readLineSync();
      if (nombre != null && nombre.isNotEmpty) {
        gestor.quitar(nombre);
      }

      // Para // Para ver
    } else if (opcion != null && opcion == "v") {
      gestor.mostrarCalificaciones();
    } else {
      print('Opción no válida.');
    }
  }
}

class GestorCalificaciones {
  Map<String, double> calificaciones = {};

// Para añadir
  void add(String nombre, double calificacion) {
    calificaciones[nombre] = calificacion;
    print('Calificación de "$nombre" añadida/actualizada a tu lista.');
  }

  // Para quitar
  void quitar(String nombre) {
    if (calificaciones.containsKey(nombre)) {
      calificaciones.remove(nombre);
      print('Calificación de "$nombre" eliminada de tu lista.');
    } else {
      print('El nombre "$nombre" no está en tu lista.');
    }
  }

  // Para ver
  void mostrarCalificaciones() {
    if (calificaciones.isEmpty) {
      print('No tienes calificaciones en tu lista.');
    } else {
      print('Las calificaciones son:');
      calificaciones.forEach((nombre, calificacion) {
        print('$nombre: $calificacion');
      });
    }
  }
}
