import 'package:flutter/material.dart';
import 'package:flutter_cuoi_ki/Details.dart';

class Books extends StatelessWidget {
  dynamic data;
  String type;
  Books(this.data, this.type);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/fiction.png'),
            ),
          ),
          child: Center(
            child: Column(children: [
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 200,
                child: Row(
                  children: [
                    Text(
                      type,
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                    SizedBox(
                      width: 75,
                    ),
                    TextButton(
                      style: ButtonStyle(),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_circle_left_sharp,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 260,
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/fictionSlide.png'),
                  ),
                ),
              ),
              Container(
                width: 270,
                height: 300,
                child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: ((context, index) {
                    return Book(child: data[index]);
                  }),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}

class Book extends StatelessWidget {
  final dynamic child;
  Book({this.child});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      height: 100,
      // color: Colors.red,
      child: OutlinedButton(
        onPressed: (() {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => (Details(child)),
              ));
        }),
        child: Row(children: [
          Container(
            // width: 80,
            child: Image.network(child['img']),
          ),
          Container(
            padding: EdgeInsets.only(left: 10),
            // ignore: prefer_const_literals_to_create_immutables
            child: Column(children: [
              SizedBox(
                width: 160,
                child: Text(
                  child['name'],
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(
                width: 160,
                child: Text(
                  ": ${child['author']}",
                  style: TextStyle(color: Colors.white.withOpacity(0.5)),
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Image.asset('assets/star.png', width: 20),
                  Image.asset('assets/star.png', width: 20),
                  Image.asset('assets/star.png', width: 20),
                  Image.asset('assets/star.png', width: 20),
                  Image.asset('assets/star.png', width: 20),
                ],
              ),
              Container(
                margin: EdgeInsets.only(
                  left: 10,
                ),
                width: 150,
                child: Text(
                  child['content'],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                  ),
                ),
              )
            ]),
          )
        ]),
      ),
    );
  }
}
