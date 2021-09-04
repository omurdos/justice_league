import 'package:flutter/material.dart';
import 'package:justice_league/pages/characters_page.dart';

void main() {
  runApp(JusticeLeagueApp());
}

class JusticeLeagueApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Justice League',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: "JUSTICE LEAGUE"
      ),
      home: CharactersPage(),
    );
  }
}
