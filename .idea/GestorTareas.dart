import 'dart:io';

void main() {
  GestorTareas gestor = GestorTareas();
  bool seguir = true;

  // Se encarga de el manejo de las entradas del ususario
  while (seguir) {
    stdout.write('Introduce la acción a realizar: x para salir, a para agregar una tarea, q para quitar una tarea, v para ver todas las tareas: ');
    String? opcion = stdin.readLineSync();

    // Para salir del bucle
    if (opcion != null && opcion == "x") {
      seguir = false;
      // Para añadir
    } else if (opcion != null && opcion == "a") {
      stdout.write('Introduce la tarea que quieres añadir a tu lista: ');
      String? tarea = stdin.readLineSync();
      if (tarea != null && tarea.isNotEmpty) {
        gestor.add(tarea);
      }
      // Para quitar
    } else if (opcion != null && opcion == "q") {
      stdout.write('Introduce la tarea que quieres quitar de tu lista: ');
      String? tarea = stdin.readLineSync();
      if (tarea != null && tarea.isNotEmpty) {
        gestor.quitar(tarea);
      }
      // Para ver
    } else if (opcion != null && opcion == "v") {
      gestor.mostrarTareas();
    } else {
      print('Opción no válida.');
    }
  }

}

class GestorTareas {
  List<String> tareas = [];

  // Para añadir
  void add(String tarea) {
    tareas.add(tarea);
    print('Tarea "$tarea" añadida a tu lista.');
  }

  // Para quitar
  void quitar(String tarea) {
    if (tareas.contains(tarea)) {
      tareas.remove(tarea);
      print('Tarea "$tarea" eliminada de tu lista.');
    } else {
      print('La tarea "$tarea" no está en tu lista.');
    }
  }

  // Para ver
  void mostrarTareas() {
    if (tareas.isEmpty) {
      print('No tienes tareas en tu lista.');
    } else {
      print('Tus tareas son:');
      for (var i = 0; i < tareas.length; i++) {
        print('${i + 1}. ${tareas[i]}');
      }
    }
  }
}
