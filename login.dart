import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Sign In.dart';
class Splash extends StatefulWidget {
  const Splash({Key?key}) :super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigatetohome();

  }
  _navigatetohome() async {
    await Future.delayed(Duration(milliseconds: 1500), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:[
                  Center(
                    child:
                    Text('FOOD App',style: TextStyle(fontSize: 20,color: Colors.blue ,fontWeight: FontWeight.bold),),
                  )]))


    );
  }
}