import 'package:flutter/material.dart';
import 'data/ghibli_film.dart';

class FilmsPage extends StatelessWidget {
  final List<Film> films;
  FilmsPage(this.films);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FilmsList(films: films)
    );
  }
}

class FilmsList extends StatefulWidget {
  final List<Film> films;
  FilmsList({ Key key, this.films }) : super(key: key);

  @override
  _FilmsListState createState() => _FilmsListState();
}

class _FilmsListState extends State<FilmsList> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        children: _buildContactList()
    );
  }

  List<_FilmListItem> _buildContactList() {
    return widget.films.map((contact) => _FilmListItem(contact))
        .toList();
  }
}

class _FilmListItem extends ListTile {
  _FilmListItem(Film film) :
        super(
        title : Text(film.title),
        subtitle: Text(film.description),
      );
}