import 'package:flutter/material.dart';
import 'package:latihan/screens/home.dart';
import 'package:latihan/screens/user.dart';
import 'package:latihan/screens/bookmark.dart';
import 'package:flutter/services.dart';

class BottomNavigatorController extends StatefulWidget {
  @override
  _BottomNavigatorControllerState createState() =>
      _BottomNavigatorControllerState();
}

class _BottomNavigatorControllerState extends State<BottomNavigatorController> {
  final List pages = [
    Home(
      key: PageStorageKey('dashboard'),
    ),
    Bookmark(
      key: PageStorageKey('bookmark'),
    ),
    User(
      key: PageStorageKey('user'),
    )
  ];

  final PageStorageBucket bucket = PageStorageBucket();

  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  Widget _bottomNavigatorBar(int selectedIndex) => BottomNavigationBar(
        onTap: (int index) => setState(() => _selectedIndex = index),
        currentIndex: selectedIndex,
        backgroundColor: Colors.blue,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white54,
        iconSize: 28,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: "Bookmark",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.supervised_user_circle),
            label: 'user',
          )
        ],
      );

  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.blue));
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: PageStorage(bucket: bucket, child: pages[_selectedIndex]),
      bottomNavigationBar: _bottomNavigatorBar(_selectedIndex),
    );
  }
}
