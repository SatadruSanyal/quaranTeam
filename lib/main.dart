import 'package:flutter/material.dart';
import 'addInterests.dart';
import 'journal.dart';
import 'viewProfile.dart';
import 'calendar.dart';
import 'bottomNavigationBar.dart';


int score = 0; //TODO: HARDCODED SCORE - CHANGE

void main() => runApp(MyApp());

final TextStyle standardFont = TextStyle(fontSize: 18);
final TextStyle headerFont = TextStyle(fontSize: 24, fontWeight: FontWeight.bold);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup Name Generator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blueAccent,
      ),
      home: HomePage());
  }
}


class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageState();
  HomePage({Key key, this.title}) : super(key: key);
  final String title;


}

class HomePageState extends State<HomePage> {
  BuildContext thisContext;
  //int _selectedIndex = 0;
  //This integer is not required
  @override
  Widget build(BuildContext context) {
    thisContext = context;
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to QuaranTeam!'),
      ),
      body: _homePageBody(),
      bottomNavigationBar: bottomNavBar(0),
    );

  }

  Widget _homePageBody() {
    return Column(
      children: <Widget>[
        //Items in activity page start here
        Container(
          //height: 40, // give it a fixed height constraint
          padding: const EdgeInsets.all(30.0),
          margin: const EdgeInsets.only(top: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Search',textAlign: TextAlign.left, style: headerFont,),

              TextFormField(
                decoration: InputDecoration(
                    labelText: 'Type in keyword eg.: Reading, Stress-Relief'
                ),
              )
            ],
          ),
        ),

        Container(
          //height: 40, // give it a fixed height constraint
          margin: const EdgeInsets.only(top: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Curated events', style: headerFont,),

              Text('''Add suggested activites to your calendar by swiping up and remove by swiping down. For more info, hold on the activity.''',
                maxLines: 20, style: TextStyle(fontSize: 12.0 ,fontWeight:FontWeight.bold,color: Colors.black) , )
            ],
          ),
        ),

        Container(
          height: 40, // give it a fixed height constraint
          margin: const EdgeInsets.only(top: 30.0),
          child:
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              const Image(
                image: NetworkImage('https://assets.materialup.com/uploads/d6522050-2ab3-4c75-945c-90fbb0ddd5ac/preview.jpg'),
                width: 110,
                height: 110,
                fit: BoxFit.scaleDown,
              ),
              const Image(
                image: NetworkImage('https://cdn4.iconfinder.com/data/icons/flat-brand-logo-2/512/beats-512.png'),
                width: 100,
                height: 100,
                fit: BoxFit.scaleDown,
              ),
              const Image(
                image: NetworkImage('https://www.kidsloveclothes.co.uk/wp-content/uploads/2019/04/BigEdinPubQuiz_LOGO-01-e1559039782364.png'),
                width: 100,
                height: 100,
                fit: BoxFit.scaleDown,
              ),
              const Image(
                image: NetworkImage('https://upload.wikimedia.org/wikipedia/en/thumb/e/ea/EA_Sports.svg/1200px-EA_Sports.svg.png'),
                width: 100,
                height: 100,
                fit: BoxFit.scaleDown,
              ),
            ],
          ),

        ),

        Container(
          height: 40, // give it a fixed height constraint
          margin: const EdgeInsets.only(bottom: 30.0),
          child:
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              Text(
                "F1 watch party",
                style: TextStyle(fontSize: 10.0),
              ),
              Text(
                "Dr Dre Virtual Concert",
                style: TextStyle(fontSize: 10.0),
              ),
              Text(
                "Town Pub Quiz",
                style: TextStyle(fontSize: 10.0),
              ),
              Text(
                "FIFA Tournament",
                style: TextStyle(fontSize: 10.0),
              ),
            ],
          ),

        ),

        Container(
          height: 40, // give it a fixed height constraint
          child:
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              const Image(
                image: NetworkImage('https://is4-ssl.mzstatic.com/image/thumb/Purple18/v4/b7/f4/7f/b7f47ff8-4f07-936a-a190-600c063501e1/source/256x256bb.jpg'),
                width: 110,
                height: 110,
                fit: BoxFit.scaleDown,
              ),
              const Image(
                image: NetworkImage('https://at-cdn-s01.audiotool.com/2015/03/23/documents/party_time-XmuJ1udGf/1/cover256x256-d3ce7fd9e672478a856aa4b532d0146c.jpg'),
                width: 100,
                height: 100,
                fit: BoxFit.scaleDown,
              ),
              const Image(
                image: NetworkImage('https://www.nasa.gov/sites/default/files/files/nasa_insignia_300.jpg'),
                width: 100,
                height: 100,
                fit: BoxFit.scaleDown,
              ),
              const Image(
                image: NetworkImage('https://res-4.cloudinary.com/crunchbase-production/image/upload/c_lpad,h_256,w_256,f_auto,q_auto:eco/v1475163424/jkblmtyibhimzxmgjh2y.jpg'),
                width: 100,
                height: 100,
                fit: BoxFit.scaleDown,
              ),
            ],
          ),

        ),

        Container(
          height: 40, // give it a fixed height constraint
          margin: const EdgeInsets.only(bottom: 30.0),
          child:
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              Text(
                "Yoga with friends",
                style: TextStyle(fontSize: 10.0),
              ),
              Text(
                "Virtual Rave Nation",
                style: TextStyle(fontSize: 10.0),
              ),
              Text(
                "NASA Space Apps",
                style: TextStyle(fontSize: 10.0),
              ),
              Text(
                "Merc Virtual Tour",
                style: TextStyle(fontSize: 10.0),
              ),
            ],
          ),

        ),

//        Container(
//          //height: 40, // give it a fixed height constraint
//          //margin: const EdgeInsets.only(top: 30.0),
//          child: Column(
//            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//            children: [
//              Text('Socialise', style: headerFont,),
//
//              Text('''Explore what your friends are doing soon and jump on with them!''',
//                maxLines: 20, style: TextStyle(fontSize: 12.0 ,fontWeight:FontWeight.bold,color: Colors.black) , )
//            ],
//          ),
//        ),

//        Container(
//          height: 40, // give it a fixed height constraint
//          child:
//          Row(
//            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//            children: [
//
//              const Image(
//                image: NetworkImage('https://www.gstatic.com/tv/thumb/persons/1156788/1156788_v9_aa.jpg'),
//                width: 110,
//                height: 110,
//                fit: BoxFit.scaleDown,
//              ),
//              const Image(
//                image: NetworkImage('https://i.guim.co.uk/img/media/0dae2063eda63e5da1810895aff69e1ef600d0fb/0_598_4912_2946/master/4912.jpg?width=1200&height=1200&quality=85&auto=format&fit=crop&s=3f1a4b410e90e91203bb625f3d53efed'),
//                width: 100,
//                height: 100,
//                fit: BoxFit.scaleDown,
//              ),
//              const Image(
//                image: NetworkImage('https://pyxis.nymag.com/v1/imgs/cd5/155/ebb6130fbeec1323596cd2afda58ef84e7-22-terry-jones-monty-python.rvertical.w570.jpg'),
//                width: 100,
//                height: 100,
//                fit: BoxFit.scaleDown,
//              ),
//              const Image(
//                image: NetworkImage('https://ichef.bbci.co.uk/images/ic/480xn/p00q7zvr.jpg'),
//                width: 100,
//                height: 100,
//                fit: BoxFit.scaleDown,
//              ),
//            ],
//          ),
//
//        ),

//        Container(
//          height: 40, // give it a fixed height constraint
//          margin: const EdgeInsets.only(bottom: 30.0),
//          child:
//          Row(
//            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//            children: [
//
//              Text(
//                "John Hoarse",
//                style: TextStyle(fontSize: 10.0),
//              ),
//              Text(
//                "Roy Jeeralph",
//                style: TextStyle(fontSize: 10.0),
//              ),
//              Text(
//                "Terry Cronks",
//                style: TextStyle(fontSize: 10.0),
//              ),
//              Text(
//                "Adam Sloth",
//                style: TextStyle(fontSize: 10.0),
//              ),
//            ],
//          ),
//
//        ),

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
