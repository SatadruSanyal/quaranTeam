import 'package:flutter/material.dart';
import 'addInterests.dart';
import 'journal.dart';
import 'viewProfile.dart';
import 'calendar.dart';
import 'main.dart';

class bottomNavBar extends StatelessWidget {
  BuildContext thisContext;
  int thisIndex;

  bottomNavBar(this.thisIndex);

  @override
  Widget build(BuildContext context) {
    thisContext = context;
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text('Home'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.library_books),
          title: Text('Journal'),
        ),

        BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text('Interests')
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          title: Text('Profile'),
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            title: Text('Calendar')
        ),
      ],
      currentIndex: thisIndex,
      selectedItemColor: Colors.blueAccent,
      unselectedItemColor: Colors.grey,
      onTap: _onItemTapped,
      //To always show labels
      showSelectedLabels: true,
      showUnselectedLabels: true,
    );
  }

  void _onItemTapped(int index) {
    if (index == thisIndex) {
      return;
    }
    if (index == 0) {
      _goHome();
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

  void _goHome() {
    Navigator.popUntil(thisContext, ModalRoute.withName('/'));
  }
}


