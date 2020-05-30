import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

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
        Text('Welcome! Please Choose Your Interests', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
        Expanded(
            child: _buildSuggestions()
        ),
        IconButton(
          icon: Icon(Icons.check_circle, color: Colors.green,),
          iconSize: 40.0,
          onPressed: _homePage
        )
      ],
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        _addSuggestions();
        if (i < 3) {
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
    _suggestions.add(Text('Painting'));
    _suggestions.add(Text('Video Games'));
    _suggestions.add(Text('Religion'));
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
  InterestsState createState() => InterestsState();
}
