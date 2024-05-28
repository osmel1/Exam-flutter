import 'package:flutter/material.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('À propos de l\'application'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/logo.jpg'),
                radius: 50,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Gestion de Bibliothèque',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Bienvenue dans notre application de gestion de bibliothèque. '
                  'Cette application est conçue pour vous aider à gérer facilement '
                  'et efficacement vos collections de livres, vos membres, et les prêts de livres.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Fonctionnalités :',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            SizedBox(height: 5),
            Text(
              '• Ajout, modification et suppression de livres\n'
                  '• Gestion des membres de la bibliothèque\n'
                  '• Suivi des prêts et retours de livres\n'
                  '• Notifications pour les retards de retour\n'
                  '• Recherche facile de livres et de membres',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Notre équipe :',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            SizedBox(height: 5),
            Text(
              'Nous sommes une équipe passionnée de développeurs et de bibliothécaires '
                  'qui visons à simplifier la gestion des bibliothèques à travers une solution intuitive et performante.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Contact :',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            SizedBox(height: 5),
            Text(
              'Si vous avez des questions ou des suggestions, n\'hésitez pas à nous contacter à '
                  'l\'adresse email suivante : support@librarymanager.com.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}