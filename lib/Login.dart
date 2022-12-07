import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_cuoi_ki/Genre.dart';
import 'package:flutter_cuoi_ki/register.dart';
import 'package:http/http.dart' as http;

class Login extends StatelessWidget {
  dynamic dataUsers;
  dynamic dataBooks;
  Login(this.dataUsers, this.dataBooks);

  final _email = TextEditingController();
  final _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('/login.png'),
            ),
          ),
          child: Center(
            child: Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                SizedBox(
                  height: 220,
                ),
                Text(
                  'Login:',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
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
                    // ignore: prefer_const_constructors
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'User ID:',
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
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextButton(
                  style: ButtonStyle(),
                  onPressed: (() {
                    var check = false;
                    for (var e in dataUsers) {
                      if (_email.text.trim() == e['mail'] &&
                          _password.text.trim() == e['password']) {
                        check = true;
                      }
                    }
                    if (check) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => (Genre(dataBooks)),
                          ));
                    } else {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                (Register(dataUsers, dataBooks)),
                          ));
                    }
                  }),
                  child: Icon(
                    Icons.arrow_circle_right_sharp,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: 200,
                  child: Text(
                    'New user-Create and account and sign up for seamless Exploring:',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: 110,
                  child: ElevatedButton(
                    onPressed: (() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                (Register(dataUsers, dataBooks)),
                          ));
                    }),
                    // ignore: prefer_const_literals_to_create_immutables
                    // ignore: sort_child_properties_last
                    // ignore: prefer_const_literals_to_create_immutables
                    child: Row(children: [
                      Text('Sign Up'),
                      SizedBox(
                        width: 6,
                      ),
                      Icon(Icons.arrow_circle_right_sharp),
                    ]),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.green),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)))),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
