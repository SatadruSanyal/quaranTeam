import 'package:flutter/material.dart';
import 'addInterests.dart';
import 'journal.dart';


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

class HomePage extends StatelessWidget {
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
            title: Text('Journal')
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            title: Text('Profile')
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text('Interests')
          )
        ],
        currentIndex: 0,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
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
    //TODO: ADD NAVIGATION TO PROFILE
  }



  Widget _homePageBody() {
    return Column(
      children: <Widget>[
        Text('My Score:' + score.toString(), style: headerFont,),
        Center(
            child: MaterialButton(
                onPressed: _goToCategories,
                color: Colors.blueAccent,
                textColor: Colors.white,
                child: Text('Add Interests', style: standardFont,)),
        ),
        Center(
            child: MaterialButton(
                onPressed: _goToJournal,
                disabledColor: Colors.grey,
                color: Colors.blueAccent,
                textColor: Colors.white,
                child: Text('My Journal', style: standardFont,)),
        ),
      ],
    );
  }




  void _onItemTapped(int index) {
    if (index == 0) {
      return;
    } else if (index == 1) {
      _goToJournal();
      return;
    } else if (index ==1) {
      _goToProfile();
      return;
    } else {
      _goToCategories();
      return;
    }
  }

}