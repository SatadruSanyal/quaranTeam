import 'package:flutter/material.dart';
import 'journal.dart';
import 'package:flutter/cupertino.dart';

final TextStyle standardFont = TextStyle(fontSize: 18);
final TextStyle headerFont = TextStyle(fontSize: 24, fontWeight: FontWeight.bold);

Widget entry;

class JournalEntry extends StatelessWidget {

  String eventName;
  String description;
  String category = 'Select Category';
  DateTime date = DateTime(2020, 1, 1);

  BuildContext thisContext;

  void _updateName(String name) {
    eventName = name;
  }

  void _updateDescription(String desc) {
    description = desc;
  }


  @override
  Widget build(BuildContext context) {
    thisContext = context;
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
              Text('Event name (2pts):', style: standardFont),
              Expanded(
                child:Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Name of Event',
                  ),
                    onChanged: _updateName,
                  ),
                ),
              )
          ],
        ),
            Row(
              children: <Widget>[
                Text('Event Category (1pt):', style: standardFont,),
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
                    items: <String>['Select Category','Sport', 'Technology', 'Entertainment', 'Arts', 'Health and Fitness', 'Miscellaneous']
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
                Text('Date: ', style: standardFont),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    height: 50,
                    width: 300,
                    child: CupertinoDatePicker(
                      mode: CupertinoDatePickerMode.date,
                      initialDateTime: date,
                      onDateTimeChanged: (DateTime newDateTime) {
                        date = newDateTime;
                      },
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Text('Today I:', style: standardFont),
                Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: 'Describe the event (10pts)'
                    ),
                    maxLines: null,
                    onChanged: _updateDescription,
                  ),
                ),
                )

              ],
            ),
            SizedBox(height: 130,),
//            Text('Points for this entry: ' + _genPoints().toString(), style: standardFont,),
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

  int _genPoints() {
    int score = 0;
    if (eventName != null) {
      score +=2;
    } else {
      eventName = 'Anonymous Event';
    }
    if (category != 'Select Category') {
      score +=1;
    } else {
      category = 'No Category';
    }
    if (description != null) {
      score += 10;
    } else {
      description = '';
    }
    return score;
  }

  void saveEvent() {
    addToScore(_genPoints());
    addEntry(_buildEntry());
    Route route = MaterialPageRoute(builder: (context) => Journal());
    Navigator.pop(thisContext);
    Navigator.pushReplacement(thisContext, route);
  }

  Widget _buildEntry() {
    return new Entry(eventName, description, category, thisContext, date);
  }

}

class Entry extends StatelessWidget {

  String name;
  String description;
  String category;
  DateTime date;
  BuildContext thisContext;

  Entry(this.name, this.description, this.category, this.thisContext, DateTime date);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View Entry'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.mode_edit),
            onPressed: _goToEditEvent,
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Text('Category: ' + category, style: TextStyle(fontSize: 18, color: Colors.grey), textAlign: TextAlign.center,),
          Text('Today I ' + description, style: standardFont,)
        ],
      ),
    );
  }

  void _goToEditEvent() {

  }



}