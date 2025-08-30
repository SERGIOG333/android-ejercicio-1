import 'package:flutter/material.dart';

void main() => runApp(const AppBarApp());

class AppBarApp extends StatelessWidget {
  const AppBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AppBarExample(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class AppBarExample extends StatefulWidget {
  const AppBarExample({super.key});

  @override
  _AppBarExampleState createState() => _AppBarExampleState();
}

class _AppBarExampleState extends State<AppBarExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AppBar'),
        backgroundColor: const Color.fromARGB(204, 255, 0, 0),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.home),
            tooltip: 'Mostrar Snackbar',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('primer icono')),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.add_alert),
            tooltip: 'Mostrar Snackbar',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('segundo icono')),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.navigate_next),
            tooltip: 'Ir a la siguiente página',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) {
                    return Scaffold(
                      appBar: AppBar(
                          title: const Text('Esta es la otra pagina')),
                      body: const Center(
                        child: Text(
                          'Esta es otra página',
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(204, 255, 0, 0),
              ),
              child: Text(
                'Menú de navegación',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Lista de lenguajes'),
              onTap: () {
                Navigator.pop(context); // Cierra el drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LenguajesPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Cards'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CardsPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: const Center(
        child: Text(
          'Esta es la página principal',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

// Nueva pantalla de Lenguajes
class LenguajesPage extends StatelessWidget {
  const LenguajesPage({super.key});

  // Lista de lenguajes
  final List<String> lenguajes = const [
    "Python",
    "Java",
    "C++",
    "C#",
    "JavaScript",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de lenguajes"),
        backgroundColor: const Color.fromARGB(204, 255, 0, 0),
      ),
      body: ListView.builder(
        itemCount: lenguajes.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.code, color: Color.fromARGB(255, 255, 0, 0)),
            title: Text(
              lenguajes[index],
              style: const TextStyle(fontSize: 18),
            ),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Seleccionaste: ${lenguajes[index]}")),
              );
            },
          );
        },
      ),
    );
  }
}

// Nueva pantalla de Cards con imágenes
class CardsPage extends StatelessWidget {
  const CardsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cards"),
        backgroundColor: const Color.fromARGB(204, 255, 0, 0),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: <Widget>[
          // Card 1 con imagen
          Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              children: [
                Image.asset('../assets/images/imagen1.jpg', fit: BoxFit.cover),
                const ListTile(
                  title: Text('hola hola'),
                  subtitle: Text('1'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          
          // Card 2 con imagen
          Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              children: [
                Image.asset('../assets/images/imagen2.jfif', fit: BoxFit.cover),
                const ListTile(
                  title: Text('hola hola'),
                  subtitle: Text('2'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          
          // Card 3 con imagen
          Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              children: [
                Image.asset('../assets/images/imagen3.jpg', fit: BoxFit.cover),
                const ListTile(
                  title: Text('hola hola'),
                  subtitle: Text('3'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          
          // Card 4 con imagen
          Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              children: [
                Image.asset('../assets/images/imagen4.jfif', fit: BoxFit.cover),
                const ListTile(
                  title: Text('hola hola'),
                  subtitle: Text('4'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
