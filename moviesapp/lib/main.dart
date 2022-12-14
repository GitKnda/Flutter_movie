import 'package:flutter/material.dart';
import 'package:moviesapp/screens/MoviesAppHome.dart';

void main() => runApp(MoviesApp());

class MoviesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recherche de films',
      theme: new ThemeData(scaffoldBackgroundColor: const Color(0xFF000000)),
      home: MoviesAppHome() ,
    );
  }
}