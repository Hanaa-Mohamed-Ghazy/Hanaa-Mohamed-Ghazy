import 'package:flutter/material.dart';
void main() {
  runApp(const BusinessCardApp());
}

class BusinessCardApp extends StatelessWidget {
  const BusinessCardApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: const Color(0xFF0d0287),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CircleAvatar(
                  radius: 112,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 110,
                    backgroundImage: AssetImage('images/image.jpg'),
                  )),
              Text(
                'Hana Mohammed',style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontFamily: 'Pacifico'
              ),
              ),
              Text(
                'FLUTTER DEVELOPER',
                style: TextStyle(
                  color: Color(0xFF6C8090),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Divider(
                color: Color(0xFF6C8090),
                thickness: 1,
                indent: 60,
                endIndent: 60,
                height: 10,
              ),
              Card(
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: ListTile(
                  leading: Icon(
                    Icons.phone,
                    size: 32,
                    color: Color(0xFF0d0287),
                  ),
                  title: Text(
                    '(+20) 1234567789',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: ListTile(
                  leading: Icon(
                    Icons.mail,
                    size: 32,
                    color: Color(0xFF0d0287),
                  ),
                  title: Text(
                    'Hanamoh886@gmail.com',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ),

            ],
          ),

        )
    );

  }
}
