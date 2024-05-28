import 'package:flutter/material.dart';
import 'package:library_manager/Model/Livre.dart';
class AddBookScreen extends StatefulWidget {
  final Function(Livre) onBookAdded;
  final Livre? bookToEdit; // Optional: Book to edit

  AddBookScreen({required this.onBookAdded, this.bookToEdit});

  @override
  _AddBookScreenState createState() => _AddBookScreenState();
}

class _AddBookScreenState extends State<AddBookScreen> {
  final _formKey = GlobalKey<FormState>();
  String _title = '';
  String _author = '';
  String _imageUrl = '';
  String _description = '';

  @override
  void initState() {
    super.initState();
    if (widget.bookToEdit != null) {
      _title = widget.bookToEdit!.title;
      _author = widget.bookToEdit!.author;
      _imageUrl = widget.bookToEdit!.imageUrl;
      _description = widget.bookToEdit!.description;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.bookToEdit == null ? 'Add New Book' : 'Edit Book'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: _title,
                decoration: InputDecoration(labelText: 'Title'),
                onSaved: (value) => _title = value ?? '',
                validator: (value) => value!.isEmpty ? 'Please enter a title' : null,
              ),
              TextFormField(
                initialValue: _author,
                decoration: InputDecoration(labelText: 'Author'),
                onSaved: (value) => _author = value ?? '',
                validator: (value) => value!.isEmpty ? 'Please enter an author' : null,
              ),
              TextFormField(
                initialValue: _imageUrl,
                decoration: InputDecoration(labelText: 'Image URL'),
                onSaved: (value) => _imageUrl = value ?? '',
                validator: (value) => value!.isEmpty ? 'Please enter an image URL' : null,
              ),
              TextFormField(
                initialValue: _description,
                decoration: InputDecoration(labelText: 'Description'),
                onSaved: (value) => _description = value ?? '',
                validator: (value) => value!.isEmpty ? 'Please enter a description' : null,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    final editedBook = Livre(
                      title: _title,
                      author: _author,
                      imageUrl: _imageUrl,
                      description: _description,
                    );
                    widget.onBookAdded(editedBook);
                    Navigator.pop(context);
                  }
                },
                child: Text(widget.bookToEdit == null ? 'Add Book' : 'Save Changes'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
