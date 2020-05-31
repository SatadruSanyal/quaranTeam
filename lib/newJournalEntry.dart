import 'package:flutter/material.dart';

final TextStyle standardFont = TextStyle(fontSize: 18);
final TextStyle headerFont = TextStyle(fontSize: 24, fontWeight: FontWeight.bold);

Widget entry;

class JournalEntry extends StatelessWidget {
  String category = 'Select category';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Journal Entry'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Row(
            children: <Widget>[
              Text('Event name:', style: standardFont),
              Expanded(
                child:Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Name of Event'
                  ),
                  ),
                ),
              )
          ],
        ),
            Row(
              children: <Widget>[
                Text('Event Description:', style: standardFont),
                Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: 'Describe the event'
                    ),
                    maxLines: null,
                  ),
                ),
                )

              ],
            )
          ],
        ),
      ),
    );
  }

}