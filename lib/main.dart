import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'data/ghibli_film.dart';
import 'dart:convert';
import 'films_view.dart';

Future<List<Film>> fetchFilms() async {
  final JsonDecoder _decoder = new JsonDecoder();
  final response =
  await http.get('https://ghibliapi.herokuapp.com/films');
  final jsonBody = response.body;
  final statusCode = response.statusCode;

  if (statusCode == 200) {
    final List filmsContainer =  _decoder.convert(jsonBody);
    return filmsContainer.map( (film) => Film.fromJson(film)).toList();
  } else {
    throw Exception('Failed to load post');
  }
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ghibli Films',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: MyHomePage(title: 'Ghibli Films'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: FutureBuilder<List<Film>>(
          future: fetchFilms(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return FilmsPage(snapshot.data);
            } else if (snapshot.hasError) {
              print("${snapshot.error}");
              return Text("${snapshot.error}");
            }
            return CircularProgressIndicator();
          },
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
