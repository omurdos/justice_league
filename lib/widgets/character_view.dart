import 'package:flutter/material.dart';
import 'package:justice_league/models/character.dart';

class CharacterView extends StatelessWidget {
  late Character character;
  CharacterView({required this.character});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Center(
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                      colors: character.colors!,
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft
                  )
              ),
            ),
          ),
          Center(child: Image.asset(character.image!))
        ],
      ),
    );
  }
}

