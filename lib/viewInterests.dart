import 'package:flutter/material.dart';
import 'bottomNavigationBar.dart';

final TextStyle standardFont = TextStyle(fontSize: 18);

class InterestsView extends StatelessWidget {

  InterestsView(this.text);
  final Set<Text> text;


  @override
  Widget build(BuildContext context) {
    final Iterable<ListTile> tiles = text.map(
          (Text word) {
        return ListTile(
          title: Text(
            word.data,
            style: standardFont,
          ),
        );
      },
    );

    final List<Widget> divided = ListTile.divideTiles(
      context: context,
      tiles: tiles,
    ).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Saved Interests'),
      ),
      body: ListView(
        children: divided
      ),
      bottomNavigationBar: bottomNavBar(2),
    );
  }}
