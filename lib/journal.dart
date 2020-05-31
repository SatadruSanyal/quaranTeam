import 'package:flutter/material.dart';
import 'newJournalEntry.dart';

final TextStyle standardFont = TextStyle(fontSize: 18);
List<Widget> entries = [];

class Journal extends StatelessWidget {
  BuildContext thisContext;

  @override
  Widget build(BuildContext context) {
    thisContext = context;
    return Scaffold(
        appBar: AppBar(
          title: Text('My Journal'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              onPressed: _addJournalEntry, //TODO: ADD FEATURE TO ADD A NEW JOURNAL ENTRY
            )
          ],
        ),
        body: ListView(
          children: entries,
        )
    );
  }

  void _addJournalEntry() {
    Navigator.of(thisContext).push(MaterialPageRoute<void>(
        builder: (BuildContext context) {
          return JournalEntry();
        }));
  }
}
