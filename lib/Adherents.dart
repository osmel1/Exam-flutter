import 'package:flutter/material.dart';
import 'package:library_manager/AdherentDetail.dart';
import 'package:library_manager/Model/Adherent.dart';
import 'package:library_manager/AjouterAdherent.dart';

class Adherents extends StatefulWidget {
  @override
  _AdherentsState createState() => _AdherentsState();
}

class _AdherentsState extends State<Adherents> {
  final List<Adherent> adherents = [
    Adherent(nom: 'Elhachimi', prenom: 'Oussama', adresse: 'Adresse1', email: 'email1@example.com', numeroDeTelephone: '123456789'),
    Adherent(nom: 'Elhachimi', prenom: 'Hatim', adresse: 'Adresse2', email: 'email2@example.com', numeroDeTelephone: '987654321'),
    Adherent(nom: 'Abdelah', prenom: 'Adaou', adresse: 'Adresse3', email: 'email3@example.com', numeroDeTelephone: '1122334455'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Library Members'),
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView.builder(
        itemCount: adherents.length,
        itemBuilder: (context, index) {
          final adherent = adherents[index];
          return Dismissible(
            key: UniqueKey(),
            direction: DismissDirection.endToStart,
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Icon(Icons.delete, color: Colors.white),
            ),
            onDismissed: (direction) {
              setState(() {
                adherents.removeAt(index);
              });
            },
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AdherentInfoPage(adherent: adherent)),
                );
              },
              child: Card(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 5,
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.deepPurple,
                    child: Icon(Icons.person, color: Colors.white),
                  ),
                  title: Text(
                    '${adherent.nom} ${adherent.prenom}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(adherent.email),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AddAdherentScreen(
                                onAdherentAdded: (editedAdherent) {
                                  setState(() {
                                    adherents[index] = editedAdherent;
                                  });
                                },
                                adherentToEdit: adherents[index],
                              ),
                            ),
                          );
                        },
                      ),
                      Icon(Icons.arrow_forward_ios),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.blueAccent,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddAdherentScreen(
                onAdherentAdded: (newAdherent) {
                  setState(() {
                    adherents.add(newAdherent);
                  });
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
