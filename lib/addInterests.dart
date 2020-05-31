import 'package:flutter/material.dart';
import 'viewInterests.dart';
import 'bottomNavigationBar.dart';

String categoryFocus = "";
final int numOfCategories = 5;
Set<Text> _saved = Set<Text>();

final TextStyle standardFont = TextStyle(fontSize: 18);
final TextStyle headerFont = TextStyle(fontSize: 24, fontWeight: FontWeight.bold);

//Hardcoded Lists of Suggestions can be added here
final List<Text> sports = [Text('Football'), Text('Golf'), Text('Tennis'), Text('Basketball'), Text('Motorsports')];
final List<Text> entertainment = [Text('Movies'), Text('New Media'), Text('Music Videos'), Text('Fashion Shows'), Text('Documentaries')];
final List<Text> health = [Text('Running'), Text('Yoga'), Text('Pilates'), Text('Weightlifting'), Text('Calisthenics')];
final List<Text> arts = [Text('Fine art'), Text('Contemporary'), Text('Art Nouveau'), Text('Pop art'), Text('Minimalism Art')];
final List<Text> tech = [Text('Phones'), Text('PC Building'), Text('Gaming'), Text('Crypto'), Text('DIYs')];

final List<Text> categories = [Text('Sports'), Text('Entertainment'), Text('Health and fitness'), Text('Arts'), Text('Technology')];
final List<Icon> categoryIcons = [Icon(Icons.directions_bike), Icon(Icons.local_activity), Icon(Icons.directions_run), Icon(Icons.palette), Icon(Icons.computer)];

class Categories extends StatefulWidget {
  @override
  CategoriesState createState() => CategoriesState();
}

class CategoriesState extends State<Categories>{

  void _pushSaved() {
    Navigator.of(context).push(MaterialPageRoute<void>(
        builder: (BuildContext context) => InterestsView(_saved).build(context)));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select a category'),
        actions: <Widget>[
//          IconButton(icon: Icon(Icons.list)),
        ],
      ),
      body: _categoryColumn(),
      bottomNavigationBar: bottomNavBar(2),
    );
  }

  Widget _categoryColumn() {
    return Column(
      children: <Widget>[
        Text('Please select a category', style: headerFont),
        Expanded(
            child: _buildCategories()
        ),
        FlatButton(
          onPressed: _pushSaved,
          child: Text('View Saved Interests', style: TextStyle(fontSize: 18, color: Colors.white),),
          color: Colors.blueAccent,
        )
      ],
    );
  }

  Widget _buildCategories() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i < numOfCategories) {
            return _buildRow(categories[i], categoryIcons[i]);
          }
          return null;
        }

    );
  }

  Widget _buildRow(Text word, Icon icon) {
    return ListTile(
      title: Text(
        word.data,
        style: standardFont,
      ),
      trailing: icon,
      onTap: () {
        //Find which category was tapped
        categoryFocus = word.data;
        //Move over to InterestsState
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Interests()),
        );
        //EOF
      },
    );
  }

//End of class!
}


class Interests extends StatefulWidget {
  @override
  InterestsState createState() => InterestsState();
}

class InterestsState extends State<Interests> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Your Interests'),
      ),
      body: _interestsColumn(),
    );
  }

  void _pushSaved() {
    Navigator.of(context).push(MaterialPageRoute<void>(
       builder: (BuildContext context) => InterestsView(_saved).build(context)));
  }

//  void _pushSaved() {
//    Navigator.of(context).push(MaterialPageRoute<void>(
//      builder: (BuildContext context) {
//        final Iterable<ListTile> tiles = _saved.map(
//              (Text word) {
//            return ListTile(
//              title: Text(
//                word.data,
//                style: standardFont,
//              ),
//            );
//          },
//        );
//        final List<Widget> divided = ListTile.divideTiles(
//          context: context,
//          tiles: tiles,
//        ).toList();
//
//        return Scaffold(
//          appBar: AppBar(
//            title: Text('Your Saved Interests'),
//          ),
//          body: ListView(children: divided),
//        );
//      },
//    ));
//  }
  Widget _interestsColumn() {
    return Column(
      children: <Widget>[
        Text('Please Choose Your Interests', style: headerFont),
        Expanded(
            child: _buildSuggestions()
        ),
      ],
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          List<Text> interests = _getList();
          if (i < 5) {
            return _buildRow(interests[i]);
          } else {
            return null;
          }
        }

    );
  }

//  Widget _buildSuggestions() {
//    return ListView.builder(
//        padding: const EdgeInsets.all(16.0),
//        itemBuilder: /*1*/ (context, i) {
//          if (i.isOdd) return Divider(); /*2*/
//
//          final index = i ~/ 2; /*3*/
//          if (index >= _suggestions.length) {
//            _suggestions.addAll(generateWordPairs().take(10)); /*4*/
//          }
//          return _buildRow(_suggestions[index]);
//        });
//  }

  Widget _buildRow(Text word) {
    final bool alreadySaved = _saved.contains(word);
    return ListTile(
      title: Text(
        word.data,
        style: standardFont,
      ),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(word);
          } else {
            _saved.add(word);
          }
        });
      },
    );
  }

  List<Text> _getList() {
    if (categoryFocus == "Sports"){
      return sports;
    }
    else if (categoryFocus == "Entertainment"){
      return entertainment;
    }
    else if (categoryFocus == "Health and fitness"){
      return health;
    }
    else if (categoryFocus == "Arts"){
      return arts;
    }
    else if (categoryFocus == "Technology"){
      return tech;
    }
  }

}