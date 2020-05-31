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
      body: null,
      bottomNavigationBar: bottomNavBar(4),
    );
  }

}
