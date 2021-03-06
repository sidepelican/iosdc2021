import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: SafeArea(child: RootPage()),
      ),
    );
  }
}

class RootPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      primary: true,
      padding: const EdgeInsets.all(18),
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      crossAxisCount: 3,
      children: <Widget>[
        EmojiCell(
          emoji: "ð",
          title: "Smile",
        ),
        EmojiCell(
          emoji: "ðŧ",
          title: "Mountain",
        ),
        EmojiCell(
          emoji: "ðĨ",
          title: "Milk",
        ),
        EmojiCell(
          emoji: "ðĩ",
          title: "Cactus",
        ),
        EmojiCell(
          emoji: "ð",
          title: "Cat",
        ),
        EmojiCell(
          emoji: "ðŧ",
          title: "Ghost",
        ),
        EmojiCell(
          emoji: "ðĪ",
          title: "Robot",
        ),
        EmojiCell(
          emoji: "ð",
          title: "Helicopter",
        ),
        EmojiCell(
          emoji: "ð",
          title: "Tofu on fire",
        ),
        EmojiCell(
          emoji: "ð",
          title: "Pizza",
        ),
        EmojiCell(
          emoji: "ð",
          title: "Apple",
        ),
        EmojiCell(
          emoji: "ðĪ",
          title: "zzz",
        ),
        EmojiCell(
          emoji: "ð",
          title: "Innocent",
        ),
        EmojiCell(
          emoji: "ðĪŠ",
          title: "Crazy",
        ),
        EmojiCell(
          emoji: "ð",
          title: "Eyes",
        ),
        EmojiCell(
          emoji: "ðĄ",
          title: "Oko",
        ),
        EmojiCell(
          emoji: "âïļ",
          title: "Pen",
        ),
        EmojiCell(
          emoji: "ðĶ",
          title: "Unicorn",
        ),
        EmojiCell(
          emoji: "ðŋ",
          title: "Moai",
        ),
        EmojiCell(
          emoji: "ðïļ",
          title: "Kinoko",
        ),
        EmojiCell(
          emoji: "ðĢ",
          title: "Sushi",
        ),
        EmojiCell(
          emoji: "ðĶ",
          title: "Kani",
        ),
        EmojiCell(
          emoji: "âïļ",
          title: "Scissor",
        ),
        EmojiCell(
          emoji: "ðĻâðĐâð§âð§",
          title: "Family",
        ),
        EmojiCell(
          emoji: "ðĩââ",
          title: "Tea",
        ),
        EmojiCell(
          emoji: "ð",
          title: "Banana",
        ),
        EmojiCell(
          emoji: "ð",
          title: "Halloween",
        ),
        EmojiCell(
          emoji: "ð",
          title: "Rainbow",
        ),
        EmojiCell(
          emoji: "âïļ",
          title: "Duel",
        ),
        EmojiCell(
          emoji: "ðĄ",
          title: "Idea",
        ),
        EmojiCell(
          emoji: "ð",
          title: "Key",
        ),
        EmojiCell(
          emoji: "ð",
          title: "Eggplant",
        ),
        EmojiCell(
          emoji: "â­ïļ",
          title: "Star",
        ),
        EmojiCell(
          emoji: "ð",
          title: "Manganiku",
        ),
        EmojiCell(
          emoji: "ðĐ",
          title: "Flag",
        ),
      ],
    );
  }
}

class EmojiCell extends StatelessWidget {
  final String emoji;
  final String title;

  const EmojiCell({Key? key, required this.emoji, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.elliptical(8, 8)),
        boxShadow: [
          BoxShadow(
            color: Colors.lightBlue.withAlpha(110),
            blurRadius: 4,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            emoji,
            style: TextStyle(fontSize: 36, shadows: [
              Shadow(
                color: Colors.green.withAlpha(170),
                blurRadius: 6,
              ),
            ]),
          ),
          Text(
            title,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
