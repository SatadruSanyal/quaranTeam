import 'package:flutter/material.dart';
import 'newJournalEntry.dart';
import 'bottomNavigationBar.dart';

final TextStyle standardFont = TextStyle(fontSize: 18);
final TextStyle headerFont = TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
List<Entry> entries = [];
int num_of_entries = 0;


class Journal extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => JournalState();
}

void addEntry(Widget entry) {
  entries.add(entry);
  num_of_entries++;
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
        body: _buildJournalBody(),
      bottomNavigationBar: bottomNavBar(1),
    );
  }

  void _addJournalEntry() {
    Navigator.of(thisContext).push(MaterialPageRoute<void>(
        builder: (BuildContext context) {
          return JournalEntry();
        }));
  }

  Widget _buildJournalBody() {
    return Column(
      children: <Widget>[
        SizedBox(
        height: 20,
    ),
        Text('Add More Journal Entries for More Points!', style: headerFont, textAlign: TextAlign.center,),
        Expanded(
          child: _buildEntries()
        )
      ],
    );
  }
  
  Widget _buildEntries() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isEven) {
            final int index = i~/2;
            if (index < num_of_entries) {
              return _buildRow(entries[index]);
            } else {
              return null;
            }
          } else {
            return Divider();
          }

        }

    );
  }


  Widget _buildRow(Entry e) {
    return ListTile(
      title: Text(
        e.name,
        style: standardFont,
      ),
      subtitle: Text(e.category),
      onTap: null //TODO: ADD VIEW ENTRY FEATURE,
    );
  }
}
