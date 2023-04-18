// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_cuoi_ki/Genre.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_cuoi_ki/Login.dart';

// void main() {
//   runApp(Home());
// }

class Register extends StatefulWidget {
  dynamic dataUsers;
  dynamic dataBooks;

  Register(this.dataUsers, this.dataBooks);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var thongBao = '';

  final _name = TextEditingController();

  final _email = TextEditingController();

  final _age = TextEditingController();

  final _password = TextEditingController();

  final _confirmPass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background1.png'),
              ),
            ),
            child: Center(
              child: Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    'REGISTER YOURSELF',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: 200,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white.withOpacity(0.5),
                    ),
                    child: TextFormField(
                      controller: _name,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Name:',
                        contentPadding: EdgeInsets.only(left: 20, top: -15),
                        hintStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                      ),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: 200,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white.withOpacity(0.5),
                    ),
                    child: TextFormField(
                      controller: _email,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Mail ID:',
                        contentPadding: EdgeInsets.only(left: 20, top: -15),
                        hintStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                      ),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: 200,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white.withOpacity(0.5),
                    ),
                    child: TextFormField(
                      controller: _age,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Age:',
                        contentPadding: EdgeInsets.only(left: 20, top: -15),
                        hintStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                      ),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: 200,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white.withOpacity(0.5),
                    ),
                    child: TextFormField(
                      controller: _password,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Password:',
                        contentPadding: EdgeInsets.only(left: 20, top: -15),
                        hintStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                      ),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: 200,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white.withOpacity(0.5),
                    ),
                    child: TextFormField(
                      controller: _confirmPass,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Confirm Password:',
                        contentPadding: EdgeInsets.only(left: 20, top: -15),
                        hintStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                      ),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextButton(
                    style: ButtonStyle(),
                    onPressed: () async {
                      var urlUser = Uri.parse(
                          'https://63677e3cf5f549f052d66958.mockapi.io/users');
                      var rsUser = await http.get(urlUser);
                      var users = jsonDecode(utf8.decode(rsUser.bodyBytes));
                      var checkName = _name.text.trim().length >= 6 &&
                              _name.text.trim().length <= 20
                          ? true
                          : false;
                      var checkMail = true;
                      for (var e in users) {
                        if (e['mail'] == _email.text.trim()) {
                          checkMail = false;
                        }
                      }

                      var checkPassword = _password.text.trim().length >= 6 &&
                              _password.text.trim().length <= 20
                          ? true
                          : false;

                      var checkPasswordConfirm =
                          _confirmPass.text.trim() == _password.text.trim()
                              ? true
                              : false;

                      if (checkName &&
                          checkMail &&
                          checkPassword &&
                          checkPasswordConfirm) {
                        var url = Uri.parse(
                            'https://63677e3cf5f549f052d66958.mockapi.io/users');

                        await http.post(url, body: {
                          "name": _name.text.trim(),
                          "mail": _email.text.trim(),
                          "age": _age.text.trim(),
                          "password": _password.text.trim()
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => (Genre(widget.dataBooks)),
                          ),
                        );
                      } else {
                        setState(() {
                          thongBao =
                              'Đăng kí không thành công, vui lòng nhập đúng các trường';
                        });
                      }
                    },
                    child: Icon(
                      Icons.arrow_circle_right_sharp,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: 250,
                    child: Text(
                      thongBao,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.yellow),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: (() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                (Login(widget.dataUsers, widget.dataBooks)),
                          ));
                    }),
                    child: Text('Sign In'),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.green),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)))),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
