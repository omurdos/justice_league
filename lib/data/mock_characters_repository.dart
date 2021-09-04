import 'package:flutter/material.dart';
import 'package:justice_league/models/character.dart';

class MockCharacterRepository {
  static final characters = [
    Character(name: "Batman", image: "assets/images/batman.png", colors: [Colors.black45, Colors.grey]),
    Character(name: "Superman", image: "assets/images/superman.png", colors: [Colors.blue, Colors.red]),
  ];
}