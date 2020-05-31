import 'package:flutter/material.dart';
import 'addInterests.dart';
import 'journal.dart';
import 'viewProfile.dart';
import 'viewEvents.dart';
import 'calendar.dart';
import 'package:fl_chart/fl_chart.dart';



int score = 0; //TODO: HARDOCDED SCORE - CHANGE

void main() => runApp(MyApp());

final TextStyle standardFont = TextStyle(fontSize: 18);
final TextStyle headerFont = TextStyle(fontSize: 24, fontWeight: FontWeight.bold);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup Name Generator',
      theme: ThemeData(
        primaryColor: Colors.blueAccent,
      ),
      home: HomePage());
  }
}


class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageState();

}

class HomePageState extends State<HomePage> {
  BuildContext thisContext;
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    thisContext = context;
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to QuaranTeam!'),
      ),
      body: _homePageBody(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            title: Text('Journal'),
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text('Interests')
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              title: Text('Profile'),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today),
              title: Text('Calendar')
          ),
        ],
        currentIndex: 0,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        //To always show labels
        showSelectedLabels: true,
        showUnselectedLabels: true,
      ),
    );

  }

  Widget _homePageBody() {
    return Column(
      children: <Widget>[
        Text('My Score:' + score.toString(), style: headerFont,),
        Text('Breakdown of activities this week', style: headerFont,),
        //TODO: Add pie chart and add to home page!!!




      ],
    );
  }


  void _onItemTapped(int index) {
    if (index == 0) {
      return;
    } else if (index == 1) {
      _goToJournal();
      return;
    } else if (index == 2) {
      _goToCategories();
      return;
    } else if (index == 3) {
      _goToProfile();
      return;
    } else if (index == 4) {
      _goToCalendar();
      return;
    }
    return;
  }

  void _goToCategories(){
    Navigator.of(thisContext).push(MaterialPageRoute<void>(
        builder: (BuildContext context) {
          return Categories();
        }
    ));
  }

  void _goToJournal() {
    Navigator.of(thisContext).push(MaterialPageRoute<void>(
        builder: (BuildContext context) {
          return Journal();
        }));
  }

  void _goToProfile() {
    Navigator.of(thisContext).push(MaterialPageRoute<void>(
        builder: (BuildContext context) {
          return viewProfile();
        }));
  }

  void _goToCalendar() {
    Navigator.of(thisContext).push(MaterialPageRoute<void>(
        builder: (BuildContext context) {
          return Calendar();
        }));
  }
}