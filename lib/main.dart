import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class Persona {
  late String nombre;
  late String apellidos;
  late String carrera;
  late int edad;

  Persona(this.nombre, this.apellidos, this.carrera, this.edad);

  factory Persona.conEdad(
      String nombre, String apellidos, String carrera, int edad) {
    if (edad < 0 || edad > 150) {
      throw ArgumentError('La edad debe estar entre 0 y 150 años.');
    }
    return Persona(nombre, apellidos, carrera, edad);
  }

  @override
  String toString() {
    return 'Nombre: $nombre\nApellidos: $apellidos\nCarrera: $carrera\nEdad: $edad años\n';
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  Persona? nuevaPersona;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  Future<void> _mostrarDialogo() async {
    TextEditingController nombreController = TextEditingController();
    TextEditingController apellidosController = TextEditingController();
    TextEditingController carreraController = TextEditingController();
    TextEditingController edadController = TextEditingController();

    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Ingresa tus datos'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                TextFormField(
                  controller: nombreController,
                  decoration: const InputDecoration(labelText: 'Nombre'),
                ),
                TextFormField(
                  controller: apellidosController,
                  decoration: const InputDecoration(labelText: 'Apellidos'),
                ),
                TextFormField(
                  controller: carreraController,
                  decoration: const InputDecoration(labelText: 'Carrera'),
                ),
                TextFormField(
                  controller: edadController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Edad'),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Aceptar'),
              onPressed: () {
                setState(() {
                  nuevaPersona = Persona.conEdad(
                    nombreController.text,
                    apellidosController.text,
                    carreraController.text,
                    int.parse(edadController.text),
                  );
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _navegarAProximaPantalla() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NuevaPantalla(persona: nuevaPersona),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isLandscape = constraints.maxWidth > constraints.maxHeight;

          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.headline6,
                ),
                if (nuevaPersona != null) ...[
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(20),
                      padding: EdgeInsets.all(20),
                      height:
                          isLandscape ? screenHeight * 0.5 : screenHeight * 0.2,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.blue),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        nuevaPersona!.toString(),
                        style: TextStyle(color: Colors.blue),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: _navegarAProximaPantalla,
                    child: Text('Ir a la siguiente pantalla'),
                  ),
                ],
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _mostrarDialogo();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class NuevaPantalla extends StatelessWidget {
  final Persona? persona;

  const NuevaPantalla({Key? key, this.persona}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Información de la Persona'),
      ),
      body: Center(
        child: persona != null
            ? Text(
                persona!.toString(),
                style: TextStyle(fontSize: 20),
              )
            : Text('No hay información de la persona'),
      ),
    );
  }
}
