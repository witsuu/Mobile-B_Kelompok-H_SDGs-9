import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:latihan/screens/register.dart';
import 'package:latihan/screens/bottomNavigatorController.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final _storage = new FlutterSecureStorage();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwdController = TextEditingController();
  String _mail;
  String _pass;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwdController.dispose();
  }

  void _alert(_content) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Info Login"),
            content: Text("$_content"),
            actions: [
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("OK"))
            ],
          );
        });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: EdgeInsets.only(top: 30),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/bg.png'), fit: BoxFit.cover),
          ),
          child: Form(
            key: _formKey,
            child: Center(
              child: Container(
                margin: EdgeInsets.only(top: 30),
                padding: EdgeInsets.fromLTRB(40, 20, 40, 20),
                child: Column(
                  children: [
                    Image(image: AssetImage("assets/logos/logo.png")),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: TextFormField(
                        controller: _emailController,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Email not valid";
                          } else {
                            return null;
                          }
                        },
                        style: TextStyle(fontSize: 20, color: Colors.white),
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            hoverColor: Colors.white,
                            hintText: "Masukkan Email",
                            hintStyle: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.white,
                            )),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: TextFormField(
                        controller: _passwdController,
                        style: TextStyle(fontSize: 20, color: Colors.white),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Password not valid";
                          } else {
                            return null;
                          }
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: "Password",
                            hintStyle: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                            prefixIcon:
                                Icon(Icons.security, color: Colors.white)),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 30),
                        width: double.infinity,
                        child: _buttonLogin()),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Belum punya akun ?",
                            style: TextStyle(color: Colors.white)),
                        FlatButton(
                            onPressed: () => {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Register()))
                                },
                            child: Text("Register",
                                style: TextStyle(color: Colors.white)))
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }

  Widget _buttonLogin() {
    return MaterialButton(
        textColor: Colors.white,
        color: Colors.blue,
        padding: EdgeInsets.only(top: 15, bottom: 15),
        onPressed: () => {
              if (_formKey.currentState.validate())
                {
                  _mail = _emailController.text,
                  _pass = _passwdController.text,
                  _checkLogin(_mail, _pass)
                },
            },
        child: Text(
          "LOGIN",
          style: TextStyle(fontWeight: FontWeight.bold),
        ));
  }

  void _checkLogin(email, passwd) async {
    final uri = "https://witsu-api.herokuapp.com/user/login";
    final response = await http.post(uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          'email': email,
          'password': passwd,
        }));

    if (response.statusCode == 200) {
      await _storage.write(key: 'isLogged', value: 'logged');
      await _storage.write(key: 'email', value: _mail);
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => BottomNavigatorController()),
          (route) => false);
    } else {
      _alert(response.body);
    }
  }
}
