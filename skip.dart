import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Sign In.dart';
import 'package:carousel_nullsafety/carousel_nullsafety.dart';

void main() async {  WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp();
  runApp(
       MaterialApp(
         debugShowCheckedModeBanner: false,
             title: 'First App',
            home: SkipScreen (),
  ));
}
class SkipScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            child: Carousel(
              animationDuration: Duration(seconds: 2),
              autoplay: true,
              boxFit: BoxFit.cover,
              dotBgColor: Colors.transparent,
              dotIncreasedColor: Colors.pinkAccent,
              dotSize: 10,
              images: [
                AssetImage("images/imageslider1.jpg"),
                AssetImage("images/imageslider2.jpg"),
                AssetImage("images/imageslider3.jpg"),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 60),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child:  Container(
                  height: 60,
                  width: double.infinity,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    color: Colors.pinkAccent,
                    child: Text(
                      'Skip',
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                    onPressed:(){
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (ctx) => LoginScreen(),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          )],
      ),
    );
  }
}