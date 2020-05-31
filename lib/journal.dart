import 'package:flutter/material.dart';
import 'newJournalEntry.dart';
import 'bottomNavigationBar.dart';

final TextStyle standardFont = TextStyle(fontSize: 18);
List<Widget> entries = [];
int num_of_entries = 0;


class Journal extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => JournalState();
}

class JournalState extends State<Journal> {
  BuildContext thisContext;
  int entriesNumber = num_of_entries;

  @override
  Widget build(BuildContext context) {
    thisContext = context;
    return Scaffold(
        appBar: AppBar(
          title: Text('My Journal'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              onPressed: _addJournalEntry,
            )
          ],
        ),
        body: ListView(
          children: entries,
        ),
      bottomNavigationBar: bottomNavBar(1),
    );
  }

  void _addJournalEntry() {
    Navigator.of(thisContext).push(MaterialPageRoute<void>(
        builder: (BuildContext context) {
          return JournalEntry();
        }));
  }
}
