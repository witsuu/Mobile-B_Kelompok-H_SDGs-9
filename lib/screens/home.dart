
import 'package:flutter/material.dart';
import 'package:latihan/networking/sessionUser.dart';
import 'package:latihan/screens/login.dart';

class HomeScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Home Screen",
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home screen"),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text("Welcome"),
                  MaterialButton(
                    color: Colors.green,
                    onPressed: () {
                      SessionUser().deleteSession();
                      Navigator.pushAndRemoveUntil(
                          context, MaterialPageRoute(builder: (context)=>LoginScreen()), (route) => false);
                    },
                    child: Text(
                      "LOGOUT",
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}