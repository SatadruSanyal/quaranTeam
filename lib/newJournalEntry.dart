import 'package:flutter/material.dart';

final TextStyle standardFont = TextStyle(fontSize: 18);
final TextStyle headerFont = TextStyle(fontSize: 24, fontWeight: FontWeight.bold);

Widget entry;

class JournalEntry extends StatelessWidget {
  String category = 'Select Category';
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
                Text('Event Category:', style: standardFont,),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: DropdownButton<String>(
                    value: category,
                    icon: Icon(Icons.arrow_drop_down),
                    elevation: 16,
                    underline: Container(
                      height: 2,
                      color: Colors.black
                    ),
                    onChanged: (String newValue) {
                      category = newValue;
                    },
                    items: <String>['Select Category','Sport', 'Technology', 'Entertainment', 'Arts', 'Health and Fitness']
                    .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value)
                      );
                    }).toList(),
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
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: 111,
                  height: 50,
                  child: RaisedButton(
                    onPressed: saveEvent,
                    color: Colors.green,
                    textColor: Colors.white,

                    child: Row(
                      children: <Widget>[
                        Text('Save', style: standardFont),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.check, color: Colors.white,),
                        )
                      ],
                    )
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void saveEvent() {
    //TODO: Add event saving functionality
  }
}