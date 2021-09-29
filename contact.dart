import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'Home.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen ({Key? key}) : super(key: key);

  @override
  ContactScreenState createState() => ContactScreenState();
}

class ContactScreenState extends State<ContactScreen> {
  final _auth = FirebaseAuth.instance;

  // our form key
  final _formKey = GlobalKey<FormState>();

  // editing Controller
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController messageController = new TextEditingController();
  final TextEditingController fullNameController = new TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 30,
            ),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (ctx) => Home(),
                ),
              );
            },
          ),
          elevation: 0.0,
          centerTitle: true,
          backgroundColor: Colors.grey,
          title: Text(
            "Contact",
            style: TextStyle(
                fontSize: 20,
                color: Colors.black54,
                fontWeight: FontWeight.w900),
          ),
        ),
        body: Form(
          key: _formKey,
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('images/background.jpg'))),
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextFormField(
                          autofocus: false,
                          controller: fullNameController,
                          keyboardType: TextInputType.name,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return ("Please Enter Your Name");
                            }
                            // reg expression for email validation
                            if (!RegExp(
                                "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                .hasMatch(value)) {
                              return ("Please Enter Your Name");
                            }
                            return null;
                          },
                          onSaved: (value) {
                            fullNameController.text = value!;
                          },
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.account_circle,
                              color: Colors.black,
                            ),
                            fillColor: Colors.grey[400],
                            filled: true,
                            hintText: 'Full Name',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                          ),),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          autofocus: false,
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return ("Please Enter Your Email");
                            }
                            // reg expression for email validation
                            if (!RegExp(
                                "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                .hasMatch(value)) {
                              return ("Please Enter a valid email");
                            }
                            return null;
                          },
                          onSaved: (value) {
                            emailController.text = value!;
                          },
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.black,
                            ),
                            fillColor: Colors.grey[400],
                            filled: true,
                            hintText: 'Email',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                          ),),
                        SizedBox(
                          height: 10,
                        ),

                        TextFormField(
                          autofocus: false,
                          controller: messageController,
                          keyboardType: TextInputType.name,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return ("Please Enter Your Message");
                            }
                            // reg expression for email validation
                            if (!RegExp(
                                "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                .hasMatch(value)) {
                              return ("Please Enter Message");
                            }
                            return null;
                          },
                          onSaved: (value) {
                            messageController.text = value!;
                          },
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.message,
                              color: Colors.black,
                            ),
                            fillColor: Colors.grey[400],
                            filled: true,
                            hintText: 'Message',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                          ),),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          height: 60,
                          width: double.infinity,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            color: Colors.grey,
                            child: Text('Send',
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 30),
                            ),
                            onPressed: () {
                              Fluttertoast.showToast(msg: "Contact Us successfully ");
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}