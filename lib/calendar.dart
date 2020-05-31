import 'package:flutter/material.dart';
import 'bottomNavigationBar.dart';
//import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CalendarState();
}

final TextStyle headerFont = TextStyle(fontSize: 24, fontWeight: FontWeight.bold);

class CalendarState extends State<Calendar> {
  BuildContext thisContext;

//  CalendarController _controller;
//
//  @override
//  void initState() {
//    super.initState();
//    _controller = CalendarController();
//  }
//
//  @override
//  void dispose() {
//    _controller.dispose();
//    super.dispose();
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendar'),
      ),
      body: Center(child: Text('Coming Soon', style: headerFont)), //Column(
//        children: <Widget>[
//          Container(
//            child: TableCalendar(calendarController: _controller),
//          )
//        ],
//      ),
      bottomNavigationBar: bottomNavBar(4),
    );
  }

}
