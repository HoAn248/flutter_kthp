import 'package:flutter/material.dart';
import 'package:flutter_cuoi_ki/Login.dart';

class Home extends StatelessWidget {
  dynamic dataUsers;
  dynamic dataBooks;
  Home(this.dataUsers, this.dataBooks);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background.png'),
              ),
            ),
            child: Center(
              child: Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  SizedBox(
                    height: 240,
                  ),
                  Container(
                    width: 70,
                    child: Image(
                      image: AssetImage('assets/logo.png'),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    'Start exploring book friends',
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  ElevatedButton(
                    onPressed: (() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => (Login(dataUsers, dataBooks)),
                          ));
                    }),
                    child: Text('GET STARTED'),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.green),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)))),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextButton(
                    style: ButtonStyle(),
                    onPressed: (() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => (Login(dataUsers, dataBooks)),
                          ));
                    }),
                    child: Icon(
                      Icons.arrow_circle_right_sharp,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
