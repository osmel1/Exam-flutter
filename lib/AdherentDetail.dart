import 'package:flutter/material.dart';
import 'package:library_manager/Model/Adherent.dart';

class AdherentInfoPage extends StatelessWidget {
  final Adherent adherent;

  AdherentInfoPage({Key? key, required this.adherent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${adherent.nom} ${adherent.prenom}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildInfoRow(Icons.person, 'Nom Complet', '${adherent.nom} ${adherent.prenom}'),
                Divider(),
                _buildInfoRow(Icons.home, 'Adresse', adherent.adresse),
                Divider(),
                _buildInfoRow(Icons.email, 'Email', adherent.email),
                Divider(),
                _buildInfoRow(Icons.phone, 'Téléphone', adherent.numeroDeTelephone),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String info) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: <Widget>[
          Icon(icon, color: Colors.blueAccent),
          SizedBox(width: 10),
          Text(
            '$label: ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Expanded(
            child: Text(
              info,
              style: TextStyle(fontSize: 16),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
