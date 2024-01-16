# Navigator
Flutter Persona App
Este proyecto Flutter es una aplicación sencilla que muestra cómo implementar un diseño que responda a cambios de orientación y tamaño de pantalla. La aplicación permite hacer un seguimiento del contador y agregar información sobre una persona. Se utilizan widgets como AlertDialog, Navigator, Flexible, Expanded, y LayoutBuilder para lograr un diseño adaptable.

Ejecución del Proyecto
Requisitos Previos:

Asegúrate de tener Flutter y Dart instalados en tu máquina.
Ejecuta flutter doctor para verificar que todo esté configurado correctamente.
Navega al directorio del proyecto y ejecuta:
bash
Copy code
flutter run
Esto abrirá la aplicación en un emulador o dispositivo físico.

Interactuar con la Aplicación:

Incrementa el contador al tocar el botón.
Toca "Agregar" para ingresar información sobre una persona.
Verifica que la información de la persona se muestre correctamente.
Experimenta girando el dispositivo o cambiando el tamaño de la ventana para ver cómo el diseño responde.
Estructura del Código
lib/main.dart: Contiene el código principal de la aplicación, incluyendo la definición de la clase Persona, la interfaz de usuario, y la implementación de diseño sensible utilizando Flexible, Expanded, y LayoutBuilder.

lib/nueva_pantalla.dart: Contiene la implementación de la pantalla que muestra la información de la persona.
