import 'package:flutter/material.dart';

class Read extends StatefulWidget {
  dynamic book;
  Read(this.book);

  @override
  State<Read> createState() => _ReadState(book);
}

class _ReadState extends State<Read> {
  dynamic book;
  _ReadState(this.book);
  double range = 15;
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
            child: Column(children: [
              SizedBox(
                width: 280,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back, color: Colors.white),
                    ),
                    Column(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          book['name'],
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          book['author'],
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Image(
                        image: AssetImage('/dot.png'),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 250,
                height: 400,
                margin: EdgeInsets.only(
                  top: 40,
                ),
                child: ListView(children: [
                  Text(
                    book['book'],
                    style: TextStyle(color: Colors.white, fontSize: range),
                  ),
                ]),
              ),
              SizedBox(
                height: 39,
              ),
              Container(
                height: 60,
                width: 270,
                color: Colors.black,
                child: Slider(
                  value: range,
                  onChanged: (value) {
                    setState(() => range = value);
                  },
                  max: 40,
                  min: 15,
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
