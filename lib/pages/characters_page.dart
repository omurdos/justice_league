import 'package:flutter/material.dart';
import 'package:justice_league/data/mock_characters_repository.dart';
import 'package:justice_league/widgets/character_view.dart';

class CharactersPage extends StatefulWidget {

  @override
  _CharactersPageState createState() => _CharactersPageState();
}

class _CharactersPageState extends State<CharactersPage> {
  late PageController pageController;
  int selectedIndex = 0;
  @override
  void initState() {
    pageController = PageController(initialPage: 0);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Justice League", style: Theme.of(context).textTheme.headline4,),
            ),
            Expanded(
              child: PageView(
                controller: pageController,
                onPageChanged: (index){
                  setState(() {
                    selectedIndex = index;
                  });
                },
                children: MockCharacterRepository.characters.map((e) => AnimatedContainer(
                  duration: Duration(seconds: 2),
                  curve: Curves.bounceInOut,
                  child: CharacterView(
                    character: e,
                  ),
                )).toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(MockCharacterRepository.characters[selectedIndex].name!, style: Theme.of(context).textTheme.headline4,),
            ),
          ],
        ),
      ),
    );
  }
}
