import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'addInterests.dart';
String categoryFocus = "";

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

  @override
  Widget build(BuildContext context) {
    thisContext = context;
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to QuaranTeam!'),
      ),
      body: _homePageBody(),
    );
  }

  void _goToCategories(){
    Navigator.of(thisContext).push(MaterialPageRoute<void>(
        builder: (BuildContext context) {
          return Categories();
        }
    ));
  }



  Widget _homePageBody() {
    int score = 5; //TODO: HARDOCDED SCORE - CHANGE

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
                onPressed: null,
                disabledColor: Colors.grey,
                color: Colors.blueAccent,
                textColor: Colors.white,
                child: Text('My Journal', style: standardFont,)),
        ),
      ],
    );
  }

}