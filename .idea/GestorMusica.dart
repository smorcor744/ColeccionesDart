import 'dart:io';

void main() {
  GestorMusica gestor = GestorMusica();
  bool seguir = true;

  // Se encarga de el manejo de las entradas del ususario
  while (seguir) {
    stdout.write('Introduce la acción a realizar: x para salir, v para ver los géneros, a para agregar y q para quitar un género: ');
    String? opcion = stdin.readLineSync();

    // Para salir del bucle
    if (opcion != null && opcion == "x") {
      seguir = false;

      // Para añadir
    } else if (opcion != null && opcion == "a") {
      stdout.write('Introduce el género de música que quieres añadir a tu lista: ');
      String? genero = stdin.readLineSync();
      if (genero != null && genero.isNotEmpty) {
        gestor.add(genero);
      }
      // Para quitar
    } else if (opcion != null && opcion == "q") {
      stdout.write('Introduce el género de música que quieres quitar de tu lista: ');
      String? genero = stdin.readLineSync();
      if (genero != null && genero.isNotEmpty) {
        gestor.quitar(genero);
      }
    }
    // Para ver
    } else if (opcion != null && opcion == "v") {
      gestor.mostrarTareas();
    } else {
      print('Opción no válida.');
    }
  }

  gestor.mostrarGeneros();
}

class GestorMusica {
  Set<String> generos = {};

  // Para añadir
  void add(String genero) {
    if (generos.length < 5 && genero.isNotEmpty) {
      if (!generos.contains(genero)) {
        generos.add(genero);
        print('Género "$genero" añadido a tu lista.');
      } else {
        print('El género "$genero" ya existe en tu lista.');
      }
    } else {
      print('***error*** ¡La lista de géneros musicales está completa o el género está vacío!');
    }
  }

  // Para quitar
  void quitar(String genero) {
    if (generos.contains(genero)) {
      generos.remove(genero);
      print('Género "$genero" eliminado de tu lista.');
    } else {
      print('El género "$genero" no está en tu lista.');
    }
  }

  // Para mostrar
  void mostrarGeneros() {
    print('Tus géneros son: $generos');
  }
}
