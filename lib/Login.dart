import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_cuoi_ki/Genre.dart';
import 'package:flutter_cuoi_ki/register.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  dynamic dataUsers;
  dynamic dataBooks;
  Login(this.dataUsers, this.dataBooks);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var thongBao = '';
  final _email = TextEditingController();

  final _password = TextEditingController();
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/login.png'),
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
                    obscureText: true,
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
                  onPressed: (() async {
                    var urlUser = Uri.parse(
                        'https://63677e3cf5f549f052d66958.mockapi.io/users');
                    var rsUser = await http.get(urlUser);
                    var user = jsonDecode(utf8.decode(rsUser.bodyBytes));
                    var checkEmail = false;
                    var checkPassword = false;
                    for (var e in user) {
                      if (_email.text.trim() == e['mail']) {
                        checkEmail = true;
                      }
                      if (_password.text.trim() == e['password']) {
                        checkPassword = true;
                      }
                    }
                    if (_email.text.trim() == '') {
                      setState(() {
                        thongBao = "Email không được bỏ trống";
                        _controller.text = thongBao;
                      });
                    } else if (_password.text.trim() == '') {
                      setState(() {
                        thongBao = "Mật khẩu không được bỏ trống";
                        _controller.text = thongBao;
                      });
                    } else if (!checkEmail) {
                      setState(() {
                        thongBao = "Email không chính xác!";
                        _controller.text = thongBao;
                      });
                    } else if (!checkPassword) {
                      setState(() {
                        thongBao = "Mật khẩu không chính xác!";
                        _controller.text = thongBao;
                      });
                    } else {
                      setState(() {
                        thongBao = "Đăng nhập thành công";
                        _controller.text = thongBao;
                      });
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => (Genre(widget.dataBooks)),
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
                  child: TextFormField(
                    maxLines: null,
                    textAlignVertical: TextAlignVertical.top,
                    textAlign: TextAlign.left,
                    controller: _controller,
                    readOnly: true,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                    style: TextStyle(
                      color: Colors.yellow,
                    ),
                  ),
                  // child: Text(
                  //   style: TextStyle(
                  //     color: Colors.yellow,
                  //   ),
                  //   thongBao,
                  //   semanticsLabel: 'myText',
                  // ),
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
                                (Register(widget.dataUsers, widget.dataBooks)),
                          ));
                    }),
                    // ignore: prefer_const_literals_to_create_immutables
                    // ignore: sort_child_properties_last
                    // ignore: prefer_const_literals_to_create_immutables
                    child: Row(children: [
                      Text('Sign Up'),
                      SizedBox(
                        width: 5,
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
