import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'selectInterests.dart';
String categoryFocus = "";

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup Name Generator',
      theme: ThemeData(
        primaryColor: Colors.blueAccent,
      ),
      home: Interests());
  }
}


class CategoriesState extends State<Interests>{
  final _suggestions = <Text>[];
  final _biggerFont = const TextStyle(fontSize: 15.0);


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select a category'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.list)),
        ],
      ),
      body: _startColumn(),
    );
  }

  Widget _startColumn() {
    return Column(
      children: <Widget>[
        Text('Please select a category', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
        Expanded(
            child: _buildSuggestions()
        ),
        FlatButton(
          color: Colors.green,
          textColor: Colors.blueGrey,
          //onPressed: _homePage,
          child: Text(
            "Done",
            style: TextStyle(fontSize: 30.0),
          ),
        )
//        IconButton(
//          icon: Icon(Icons.check_circle, color: Colors.green,),
//          iconSize: 40.0,
//          onPressed: _homePage
//        )
      ],
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          _addSuggestions();
          if (i < 5) {
            return _buildRow(_suggestions[i]);
          } else {
            return null;
          }
        }

    );
  }

  void _addSuggestions() {
    //Hardcoded suggestions can be added here
    _suggestions.add(Text('Sports'));
    _suggestions.add(Text('Entertainment'));
    _suggestions.add(Text('Health and fitness'));
    _suggestions.add(Text('Arts'));
    _suggestions.add(Text('Technology'));

  }

  Widget _buildRow(Text word) {
    return ListTile(
      title: Text(
        word.data,
        style: _biggerFont,
      ),
      onTap: () {
        //Find which category was tapped
        categoryFocus = word.data;
        //Move over to InterestsState
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => InterestsState().build(context)),
        );
        //EOF
      },
    );
  }



  //End of class!
}

class InterestsState extends State<Interests> {
  final _suggestions = <Text>[];
  final _biggerFont = const TextStyle(fontSize: 15.0);
  final Set<Text> _saved = Set<Text>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Your Interests'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.list), onPressed: _pushSaved),
        ],
      ),
      body: _startColumn(),
    );
  }

  void _pushSaved() {
    Navigator.of(context).push(MaterialPageRoute<void>(
      builder: (BuildContext context) {
        final Iterable<ListTile> tiles = _saved.map(
              (Text word) {
            return ListTile(
              title: Text(
                word.data,
                style: _biggerFont,
              ),
            );
          },
        );
        final List<Widget> divided = ListTile.divideTiles(
          context: context,
          tiles: tiles,
        ).toList();

        return Scaffold(
          appBar: AppBar(
            title: Text('Your Saved Interests'),
          ),
          body: ListView(children: divided),
        );
      },
    ));
  }
  Widget _startColumn() {
    return Column(
      children: <Widget>[
        Text('Please Choose Your Interests', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
        Expanded(
            child: _buildSuggestions()
        ),
        FlatButton(
          color: Colors.green,
          textColor: Colors.blueGrey,
          //onPressed: _homePage,
          child: Text(
            "Done",
            style: TextStyle(fontSize: 30.0),
          ),
        )
      ],
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          _addSuggestions();
          if (i < 5) {
            return _buildRow(_suggestions[i]);
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
    final bool already_saved = _saved.contains(word);
    return ListTile(
      title: Text(
        word.data,
        style: _biggerFont,
      ),
      trailing: Icon(
        already_saved ? Icons.favorite : Icons.favorite_border,
        color: already_saved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (already_saved) {
            _saved.remove(word);
          } else {
            _saved.add(word);
          }
        });
      },
    );
  }

  void _addSuggestions() {
    //Hardcoded suggestions can be added here
    if (categoryFocus == "Sports"){
      _suggestions.add(Text('Football'));
      _suggestions.add(Text('Golf'));
      _suggestions.add(Text('Tennis'));
      _suggestions.add(Text('Basketball'));
      _suggestions.add(Text('Motorsports'));
    }
    else if (categoryFocus == "Entertainment"){
      _suggestions.add(Text('Movies'));
      _suggestions.add(Text('New media'));
      _suggestions.add(Text('Music Videos'));
      _suggestions.add(Text('Fashion Shows'));
      _suggestions.add(Text('Documentaries'));
    }
    else if (categoryFocus == "Health and fitness"){
      _suggestions.add(Text('Running'));
      _suggestions.add(Text('Yoga'));
      _suggestions.add(Text('Pilates'));
      _suggestions.add(Text('Weightlifting'));
      _suggestions.add(Text('Calisthenics'));
    }
    else if (categoryFocus == "Arts"){
      _suggestions.add(Text('Fine art'));
      _suggestions.add(Text('Contemporary'));
      _suggestions.add(Text('Art Nouveau'));
      _suggestions.add(Text('Pop art'));
      _suggestions.add(Text('Minimalism Art'));
    }
    else if (categoryFocus == "Technology"){
      _suggestions.add(Text('Phones'));
      _suggestions.add(Text('PC building'));
      _suggestions.add(Text('Gaming'));
      _suggestions.add(Text('Crypto'));
      _suggestions.add(Text('DIYs'));
    }
  }

  void _homePage() {
    Navigator.of(context).push(MaterialPageRoute<void>(
      builder: (BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: Text('HomePage'),
            actions: <Widget>[
              IconButton(icon: Icon(Icons.list), onPressed: _pushSaved),
            ],
          ),
          body: null, //TODO: ENTER HOMEPAGE CODE HERE
        );
      },
    ));
  }
}

class Interests extends StatefulWidget {
  @override
  CategoriesState createState() => CategoriesState();
}
