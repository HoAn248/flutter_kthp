import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_cuoi_ki/Books.dart';
import 'package:http/http.dart' as http;

// void main() async {
//   var urlBook = Uri.parse('https://63677e3cf5f549f052d66958.mockapi.io/books');
//   var rsBook = await http.get(urlBook);
//   var dataBooks = jsonDecode(utf8.decode(rsBook.bodyBytes));

//   runApp(Genre(dataBooks));
// }

class Genre extends StatelessWidget {
  dynamic dataBooks;
  String type = '';
  Genre(this.dataBooks);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/genre.png'),
            ),
          ),
          child: Center(
            // ignore: prefer_const_literals_to_create_immutables
            child: Column(children: [
              SizedBox(
                height: 80,
              ),
              SizedBox(
                width: 200,
                child: Text(
                  'Tell us the books you love’d reading',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                width: 200,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white.withOpacity(0.5),
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter book name',
                    contentPadding: EdgeInsets.only(left: 10),
                    hintStyle: TextStyle(
                      color: Colors.yellow,
                      fontSize: 10,
                    ),
                    suffixIcon: Icon(Icons.close),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: 200,
                height: 0.4,
                color: Colors.white,
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: 220,
                child: Text(
                  'Start your reading journey by selecting your faviourite generes:',
                  style: TextStyle(color: Color.fromARGB(255, 127, 118, 36)),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: 200,
                child: Row(children: [
                  SizedBox(
                    width: 100,
                    child: ElevatedButton(
                      onPressed: (() {
                        List data = [];
                        for (var e in dataBooks) {
                          if (e['type'] == 'fiction') {
                            data.add(e);
                          }
                        }
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  (Books(data, type = 'Fiction')),
                            ));
                      }),
                      child: Text('Fiction'),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.white.withOpacity(0.5)),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  SizedBox(
                    width: 85,
                    child: ElevatedButton(
                      onPressed: () {
                        List data = [];
                        for (var e in dataBooks) {
                          if (e['type'] == 'classics') {
                            data.add(e);
                          }
                        }
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  (Books(data, type = 'Classics')),
                            ));
                      },
                      child: Text('Classics'),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.white.withOpacity(0.5)),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 200,
                child: Row(children: [
                  SizedBox(
                    width: 100,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Finance &Buisness',
                        softWrap: true,
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.white.withOpacity(0.5)),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  SizedBox(
                    width: 85,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('Humor'),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.white.withOpacity(0.5)),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 200,
                child: Row(children: [
                  SizedBox(
                    width: 100,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Action',
                        softWrap: true,
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.white.withOpacity(0.5)),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  SizedBox(
                    width: 85,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('History'),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.white.withOpacity(0.5)),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
