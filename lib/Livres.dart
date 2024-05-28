import 'package:flutter/material.dart';
import 'package:library_manager/AjouterLivre.dart';
import 'package:library_manager/LivreDetails.dart';
import 'package:library_manager/Model/Livre.dart';

class Livres extends StatefulWidget {
  @override
  _LivresState createState() => _LivresState();
}

class _LivresState extends State<Livres> {
  final List<Livre> books = [
    Livre(
        title: 'Flutter Development',
        author: 'John Doe',
        imageUrl: "http://books.google.com/books/content?id=_rCqIQSCkIMC&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api",
        description: "description 1"
    ),
    Livre(
        title: 'Dart Programming',
        author: 'Jane Smith',
        imageUrl: "http://books.google.com/books/content?id=zIt3dCTpLDQC&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api",
        description: "description 2"
    ),
    Livre(
        title: 'Mobile App Design',
        author: 'Robert Brown',
        imageUrl: "http://books.google.com/books/content?id=WLLAD2FKH3IC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api",
        description: "description 3"
    ),
  ];
  List<Livre> _filteredBooks = [];

  @override
  void initState() {
    super.initState();
    _filteredBooks = books;
  }

  void _searchBooks(String query) {
    setState(() {
      _filteredBooks = books.where((book) =>
      book.title.toLowerCase().contains(query.toLowerCase()) ||
          book.author.toLowerCase().contains(query.toLowerCase())
      ).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Library Books'),
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView.builder(
        itemCount: books.length,
        itemBuilder: (context, index) {
          final book = books[index];
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
                books.removeAt(index);
              });
            },
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BookDetailsScreen(book: book),
                  ),
                );
              },
              child: Card(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 5,
                child: ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      book.imageUrl,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text(
                    book.title,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(book.author),
                  trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                  IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddBookScreen(
                          onBookAdded: (editedBook) {
                            setState(() {
                              books[index] = editedBook;
                            });
                          },
                          bookToEdit: book,
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
              builder: (context) => AddBookScreen(
                onBookAdded: (newBook) {
                  setState(() {
                    books.add(newBook);
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
