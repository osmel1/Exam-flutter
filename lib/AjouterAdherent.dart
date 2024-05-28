import 'package:flutter/material.dart';
import 'package:library_manager/Model/Adherent.dart';

class AddAdherentScreen extends StatefulWidget {
  final Function(Adherent) onAdherentAdded;
  final Adherent? adherentToEdit; // Optional: Book to edit

  AddAdherentScreen({required this.onAdherentAdded, this.adherentToEdit});

  @override
  _AddAdherentScreenState createState() => _AddAdherentScreenState();
}

class _AddAdherentScreenState extends State<AddAdherentScreen> {
  final _formKey = GlobalKey<FormState>();
  String _nom = '';
  String _prenom = '';
  String _adresse = '';
  String _email = '';
  String _numeroDeTelephone = '';

  @override
  void initState() {
    super.initState();
    if (widget.adherentToEdit != null) {
      print("no problem here");
      _nom = widget.adherentToEdit!.nom;
      _prenom = widget.adherentToEdit!.prenom;
      _adresse = widget.adherentToEdit!.adresse;
      _email = widget.adherentToEdit!.email;
      _numeroDeTelephone = widget.adherentToEdit!.numeroDeTelephone;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.adherentToEdit == null ? 'Add New Adherent' : 'Edit Adherent'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: _nom,
                decoration: InputDecoration(labelText: 'Nom'),
                onSaved: (value) => _nom = value ?? '',
                validator: (value) => value!.isEmpty ? 'Please enter a name' : null,
              ),
              TextFormField(
                initialValue: _prenom,
                decoration: InputDecoration(labelText: 'Prenom'),
                onSaved: (value) => _prenom = value ?? '',
                validator: (value) => value!.isEmpty ? 'Please enter a surname' : null,
              ),
              TextFormField(
                initialValue: _adresse,
                decoration: InputDecoration(labelText: 'Adresse'),
                onSaved: (value) => _adresse = value ?? '',
                validator: (value) => value!.isEmpty ? 'Please enter an address' : null,
              ),
              TextFormField(
                initialValue: _email,
                decoration: InputDecoration(labelText: 'Email'),
                onSaved: (value) => _email = value ?? '',
                validator: (value) => value!.isEmpty ? 'Please enter an email' : null,
              ),
              TextFormField(
                initialValue: _numeroDeTelephone,
                decoration: InputDecoration(labelText: 'Numéro de Téléphone'),
                onSaved: (value) => _numeroDeTelephone = value ?? '',
                validator: (value) => value!.isEmpty ? 'Please enter a phone number' : null,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    final newAdherent = Adherent(
                      nom: _nom,
                      prenom: _prenom,
                      adresse: _adresse,
                      email: _email,
                      numeroDeTelephone: _numeroDeTelephone,
                    );
                    widget.onAdherentAdded(newAdherent);
                    Navigator.pop(context);
                  }
                },
                child:Text(widget.adherentToEdit == null ? 'Add Adherent' : 'Save Changes'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}