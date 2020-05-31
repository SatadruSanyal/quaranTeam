import 'package:flutter/material.dart';
import 'dart:ui'; // This is to get full screen size
import 'journal.dart';

final TextStyle standardFont = TextStyle(fontSize: 18);
List<Widget> entries = [];

class viewProfile extends StatelessWidget {
  BuildContext thisContext;

  @override
  Widget build(BuildContext context) {
    thisContext = context;

    return Scaffold(
        appBar: AppBar(
          title: Text('My Profile'),
          actions: <Widget>[

          ],
        ),
        body: ListView(
          children: [
            const Image(
              image: NetworkImage('https://a.thumbs.redditmedia.com/5iczxMt3y5zNmEJz1LEuIZHcv0XIInyLs3t1ZlrnGp0.png'),
              //image: NetworkImage('https://www.biography.com/.image/t_share/MTY2MzU3Nzk2OTM2MjMwNTkx/elon_musk_royal_society.jpg'),
              width: 200,
              height: 200,
              fit: BoxFit.scaleDown,
            ),

            Text(
              'Terry Crews',
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle( fontWeight: FontWeight.bold,
                                fontSize: 26.0,),

            ),

            Container(
              height: 40, // give it a fixed height constraint
              margin: const EdgeInsets.only(top: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Self care points: ',
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle( fontWeight: FontWeight.bold,
                      fontSize: 26.0,),

                  ),
                  Text(
                    '3000',
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle( fontWeight: FontWeight.bold,
                      fontSize: 26.0,),

                  ),
                ],
              ),
            ),



            Container(
              height: 40, // give it a fixed height constraint
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Journal Entries: ',
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle( fontWeight: FontWeight.bold,
                      fontSize: 26.0,),

                  ),
                  Text(
                    Journal().entriesNumber.toString(),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle( fontWeight: FontWeight.bold,
                      fontSize: 26.0,),

                  ),
                ],
              ),
            ),


            Container(
              //height: 40, // give it a fixed height constraint
              margin: const EdgeInsets.only(top: 20.0, bottom: 20.0),
              // child ListView
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                  FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Recent Activities...",
                      style: TextStyle(fontSize: 25.0),
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Image(
                        image: NetworkImage('https://i2.wp.com/www.en24.news/wp-content/uploads/2020/05/williams-overweegt-f1-team-te-verkopen-en-verliest-titelsponsor-rokit.jpg?fit=256%2C256&ssl=1'),
                        width: 50,
                        height: 50,
                        fit: BoxFit.scaleDown,
                      ),
                      Text(
                        'Watched F1 racing',
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle( fontWeight: FontWeight.bold,
                          fontSize: 14.0,),

                      ),
                    ],
                  ),
                ],
              ),
            ),


            Container(
              //height: 40, // give it a fixed height constraint
              margin: const EdgeInsets.only(top: 20.0, bottom: 20.0),
              // child ListView
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Find Friends                                                           ',
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle( fontWeight: FontWeight.bold,
                      fontSize: 25.0,),

                  ),

                  Text('''Find friends to do activities with, take part in events with and socialise with! Doing activities with friends bring you more points as well as writing in your journal.''',
                    maxLines: 20, style: TextStyle(fontSize: 12.0 ,fontWeight:FontWeight.bold,color: Colors.black) , )
                  //      ),

                ],
              ),
            ),

            Container(
              height: 100,
              width: 100,
              margin: const EdgeInsets.only(top: 20.0, bottom: 20.0),
              // child ListView
              child:
                new Container(

                  child: new Text (
                      "Sign-in to your social media accounts",
                      style: new TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w900,
                          fontSize: 20,

                      )
                  ),
                  decoration: new BoxDecoration (
                      borderRadius: new BorderRadius.all(new Radius.circular(99.0)),
                      color: Colors.grey[300]
                  ),
                  padding: new EdgeInsets.all(16.0),
                ),


            ),


            //End of Containers
          ],
        )

    );
  }

}
