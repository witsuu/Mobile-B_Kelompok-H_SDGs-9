import 'package:flutter/material.dart';
import 'package:latihan/screens/login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:latihan/screens/bottomNavigatorController.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  final _storage = new FlutterSecureStorage();
  TextEditingController _namaController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwdController = TextEditingController();
  String _mail;
  String _pass;
  String _nama;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _namaController.dispose();
    _emailController.dispose();
    _passwdController.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: EdgeInsets.only(top: 30),
          decoration: BoxDecoration(color: Colors.white),
          child: Form(
            key: _formKey,
            child: Center(
              child: Container(
                margin: EdgeInsets.only(top: 30),
                padding: EdgeInsets.fromLTRB(40, 20, 40, 20),
                child: Column(
                  children: [
                    Image(image: AssetImage("assets/logos/splash.png")),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: TextFormField(
                        controller: _namaController,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Nama lengkap tidak boleh kosong";
                          } else {
                            return null;
                          }
                        },
                        style: TextStyle(fontSize: 20),
                        decoration: InputDecoration(
                            hintText: "Masukkan Nama Lengkap",
                            contentPadding:
                                EdgeInsets.only(left: 10, bottom: -20)),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: TextFormField(
                        controller: _emailController,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Email tidak boleh kosong";
                          } else {
                            return null;
                          }
                        },
                        style: TextStyle(fontSize: 20),
                        decoration: InputDecoration(
                            hintText: "Masukkan Email",
                            contentPadding:
                                EdgeInsets.only(left: 10, bottom: -20)),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: TextFormField(
                        controller: _passwdController,
                        style: TextStyle(fontSize: 20),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Password tidak boleh kosong";
                          } else {
                            return null;
                          }
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: "Password",
                            contentPadding:
                                EdgeInsets.only(left: 10, bottom: -20)),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 30, bottom: 20),
                        width: double.infinity,
                        child: _buttonLogin()),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Sudah punya akun ?"),
                        FlatButton(
                            onPressed: () => {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Login()))
                                },
                            child: Text("Login"))
                      ],
                    )
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
        color: Colors.green,
        padding: EdgeInsets.only(top: 15, bottom: 15),
        onPressed: () => {
              if (_formKey.currentState.validate())
                {
                  _nama = _namaController.text,
                  _mail = _emailController.text,
                  _pass = _passwdController.text,
                  _checkLogin(_nama,_mail, _pass)
                },
            },
        child: Text("REGISTER"));
  }

  void _checkLogin(nama,email, passwd) async {
    final uri = "https://witsu-api.herokuapp.com/user/signup";
    final response = await http.post(uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          'nama': nama,
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

  void _alert(_content) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Info SignUp"),
            content: Text("Password hanya berisi huruf dan angka. Dan panjang minimal 6 karakter"),
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
}
