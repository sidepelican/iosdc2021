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
      crossAxisCount: 2,
      children: <Widget>[
        EmojiCell(
          emoji: "😀",
          title: "Smile",
        ),
        EmojiCell(
          emoji: "🗻",
          title: "Mountain",
        ),
        EmojiCell(
          emoji: "🥛",
          title: "Milk",
        ),
        EmojiCell(
          emoji: "🌵",
          title: "Cactus",
        ),
        EmojiCell(
          emoji: "🐈",
          title: "Cat",
        ),
        EmojiCell(
          emoji: "👻",
          title: "Ghost",
        ),
        EmojiCell(
          emoji: "🤖",
          title: "Robot",
        ),
        EmojiCell(
          emoji: "🚁",
          title: "Helicopter",
        ),
        EmojiCell(
          emoji: "📛",
          title: "Tofu on fire",
        ),
        EmojiCell(
          emoji: "🍕",
          title: "Pizza",
        ),
        EmojiCell(
          emoji: "🍎",
          title: "Apple",
        ),
        EmojiCell(
          emoji: "💤",
          title: "zzz",
        ),
        EmojiCell(
          emoji: "😇",
          title: "Innocent",
        ),
        EmojiCell(
          emoji: "🤪",
          title: "Crazy",
        ),
        EmojiCell(
          emoji: "👀",
          title: "Eyes",
        ),
        EmojiCell(
          emoji: "😡",
          title: "Oko",
        ),
        EmojiCell(
          emoji: "✏️",
          title: "Pen",
        ),
        EmojiCell(
          emoji: "🦄",
          title: "Unicorn",
        ),
        EmojiCell(
          emoji: "🗿",
          title: "Moai",
        ),
        EmojiCell(
          emoji: "🍄️",
          title: "Kinoko",
        ),
        EmojiCell(
          emoji: "🍣",
          title: "Sushi",
        ),
        EmojiCell(
          emoji: "🦀💥🦀",
          title: "Kani no Kenka",
        ),
        EmojiCell(
          emoji: "👨‍👩‍👧‍👧",
          title: "Family",
        ),
        EmojiCell(
          emoji: "🍵‍‍",
          title: "Tea",
        ),
        EmojiCell(
          emoji: "🍌",
          title: "Banana",
        ),
        EmojiCell(
          emoji: "⚔️",
          title: "Duel",
        ),
        EmojiCell(
          emoji: "💡",
          title: "Idea",
        ),
        EmojiCell(
          emoji: "🗝",
          title: "Key",
        ),
        EmojiCell(
          emoji: "🍆",
          title: "Eggplant",
        ),
        EmojiCell(
          emoji: "⭐️",
          title: "Star",
        ),
        EmojiCell(
          emoji: "🍖",
          title: "Manganiku",
        ),
        EmojiCell(
          emoji: "🚩",
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
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Text(
              emoji,
              style: TextStyle(fontSize: 36, shadows: [
                Shadow(
                  color: Colors.green.withAlpha(170),
                  blurRadius: 6,
                ),
              ]),
            ),
          ),
          Text(
            title,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
          ),
          Text(List.filled(10, title.toLowerCase()).join(" "), maxLines: 3, overflow: TextOverflow.fade),
        ],
      ),
    );
  }
}
