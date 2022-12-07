// ignore_for_file: prefer_const_constructors
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter_cuoi_ki/Home.dart';

void main() async {
  var urlUser = Uri.parse('https://63677e3cf5f549f052d66958.mockapi.io/users');
  var rsUser = await http.get(urlUser);
  var dataUser = jsonDecode(utf8.decode(rsUser.bodyBytes));

  var urlBook = Uri.parse('https://63677e3cf5f549f052d66958.mockapi.io/books');
  var rsBook = await http.get(urlBook);
  var dataBooks = jsonDecode(utf8.decode(rsBook.bodyBytes));

  runApp(MainApp(dataUser, dataBooks));
}

class MainApp extends StatelessWidget {
  dynamic dataUsers;
  dynamic dataBooks;
  MainApp(this.dataUsers, this.dataBooks);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Đồ án',
      home: Home(dataUsers, dataBooks),
    );
  }
}
/*
- id
- type
- img
- name
- author
- star
- content
- infoAuthor
- overview

 */
