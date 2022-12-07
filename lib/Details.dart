import 'package:flutter/material.dart';
import 'package:flutter_cuoi_ki/Read.dart';

class Details extends StatelessWidget {
  dynamic book;
  Details(this.book);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('/detail.png'),
            ),
          ),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 290,
                  child: Row(children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back, color: Colors.white),
                    ),
                    SizedBox(
                      width: 150,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Image(
                        image: AssetImage('/rec.png'),
                      ),
                    ),
                  ]),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  width: 300,
                  child: Column(children: [
                    SizedBox(
                      height: 200,
                      child: Image.network(book['img']),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      book['name'],
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      book['author'],
                      style: TextStyle(color: Colors.white, fontSize: 10),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: 100,
                      child: Row(
                        children: [
                          Image.asset(
                            '/star.png',
                            width: 10,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Image.asset(
                            '/star.png',
                            width: 10,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Image.asset(
                            '/star.png',
                            width: 10,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Image.asset(
                            '/star.png',
                            width: 10,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Image.asset(
                            '/star.png',
                            width: 10,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            '4.0',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 250,
                      height: 200,
                      child: ListView(
                        children: [
                          Container(
                            padding: EdgeInsets.only(bottom: 10, top: 10),
                            width: 250,
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              'About the author:',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.start,
                            ),
                          ),
                          SizedBox(
                            width: 250,
                            child: Text(
                              book['infoAuthor'],
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 10, bottom: 10),
                            width: 250,
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              'Overview:',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.start,
                            ),
                          ),
                          SizedBox(
                            width: 250,
                            child: Text(
                              book['overview'],
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.red),
                        ),
                        onPressed: (() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => (Read(book)),
                              ));
                        }),
                        child: Text('Start Reading'))
                  ]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
