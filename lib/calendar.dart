import 'package:flutter/material.dart';
import 'bottomNavigationBar.dart';

class Calendar extends StatelessWidget {
  BuildContext thisContext;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendar'),
      ),
      body: Center(
        child: Text('Coming Soon!', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
      ),
      bottomNavigationBar: bottomNavBar(4),
    );
  }

}
