import 'package:flutter/material.dart';
import 'package:latihan/screens/bottomNavigatorController.dart';
import 'package:latihan/screens/login.dart';
import 'package:latihan/networking/sessionUser.dart';


class Loader extends StatefulWidget {
  _StateLoader createState() => _StateLoader();
}

class _StateLoader extends State<Loader> {
  String isLogged;
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: Container(
        decoration: BoxDecoration(color: Colors.white30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Image(image: AssetImage('assets/logos/splash.png'))],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Padding(padding: EdgeInsets.only(top: 20), child: _checkSession())
            ])
          ],
        ),
      ),
    );
  }

  Widget _checkSession() {
    return FutureBuilder(
      future: SessionUser().getSession(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            new Future.delayed(
                Duration(seconds: 4),
                () => Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => BottomNavigatorController())));
            return CircularProgressIndicator();
          } else {
            return Container(
              child: MaterialButton(
                padding: EdgeInsets.fromLTRB(45, 15, 45, 15),
                textColor: Colors.white,
                color: Colors.lightBlue,
                onPressed: () => {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => Login()))
                },
                child: Text("SELAMAT DATANG"),
              ),
            );
          }
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
