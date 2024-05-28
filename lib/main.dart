import 'package:flutter/material.dart';
import 'package:library_manager/Livres.dart';
import 'package:library_manager/About.dart';
import 'package:library_manager/Adherents.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            'Bibliotheque ',
            style: TextStyle(
              color: Colors.blueAccent,
              fontSize: 20,
            )
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            const DrawerHeader(
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/logo.jpg'),
                  radius: 80,
                )
            ),
            Center(
              child: Text(
                'Oussama Elhachimi',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,

                ),
              ),
            ),
            ListTile(
              title: const Text('Accueil'),
              onTap: () {
              },
              leading: const Icon(
                Icons.home,
                color: Colors.blueAccent,
              ),
            ),
            ListTile(
                title: const Text('Livres'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Livres()),
                  );
                },
                leading: const Icon(
                  Icons.book,
                  color: Colors.blueAccent,
                )
            ),
            ListTile(
              title: const Text('Adhérents'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Adherents(
                  )),
                );
              },
              leading: const Icon(
                Icons.person,
                color: Colors.blueAccent,
              ),
            ),
            ListTile(
              title: const Text('À propos'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => About()),
                );
              },
              leading: const Icon(
                Icons.roundabout_left,
                color: Colors.blueAccent,
              ),
            ),
          ],
        ),
      ),
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/image1.jpeg'),
            Text('Bibliotheque Management', style: TextStyle(fontSize: 24)),
          ],
        ),
      ),
    );
  }
}
