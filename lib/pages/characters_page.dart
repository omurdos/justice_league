import 'package:flutter/material.dart';
import 'package:justice_league/data/mock_characters_repository.dart';
import 'package:justice_league/widgets/character_view.dart';

class CharactersPage extends StatefulWidget {

  @override
  _CharactersPageState createState() => _CharactersPageState();
}

class _CharactersPageState extends State<CharactersPage> with SingleTickerProviderStateMixin {
  late PageController pageController;
  late AnimationController controller;
late Animation animation;


  int selectedIndex = 0;
  @override
  void initState() {
    pageController = PageController(initialPage: 0);
    controller = AnimationController(
    duration: const Duration(milliseconds: 500), vsync: this);
    animation = Tween<double>(begin: 0, end: 300).animate(controller)
      ..addListener(() {
        setState(() {

        });
      });
    super.initState();
    controller.forward();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20,),
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
                    controller.reset();
                    controller.forward();
                  });
                },
                children: MockCharacterRepository.characters.map((e) => AnimatedBuilder(
                  animation: animation,
                  builder: (ctx, child){
                    return CharacterView(
                      character: e,
                      height: animation.value,
                      width: animation.value,
                    );
                  },
                )).toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  // Text("Hero", style: Theme.of(context).textTheme.caption,),
                  Text(MockCharacterRepository.characters[selectedIndex].name!, style: Theme.of(context).textTheme.headline4,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
