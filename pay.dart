import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'First App',
    home:Payment (),
  ));
}
class Payment extends StatefulWidget {

  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  int value = 0;
  final paymentLabels = [
    'Credit card / Debit card',
    'Cash on delivery',
    'Paypal',

  ];

  final paymentIcons = [
    Icons.credit_card,
    Icons.money_off,
    Icons.payment,
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar:  AppBar(
        title: Text('Payment', style: TextStyle(color:  Color(0xFFFF8084))),
        centerTitle: true,
        backgroundColor:Color(0xFFFFFFFF),
        elevation:0.0 ,
        automaticallyImplyLeading: false,
        iconTheme: IconThemeData(color:  Color(0xFFFF8084)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Color(0xFFFF8084) ),
          onPressed: () => Navigator.of(context).pop(),
        ) ,

      ),

      body:Container(
        child: Column(
        children: [
          HeaderLabel(
            headerText: 'Choose your payment method',
          ),
          Expanded(
            child: ListView.separated(
              itemCount: paymentLabels.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Radio(
                    activeColor:Color(0xFFFF8084) ,
                    value: index,
                    groupValue: value,
                    onChanged: (i) => setState(() => value = 1),
                  ),
                  title: Text(
                    paymentLabels[index],
                    style: TextStyle(color: Color(0xFF303030) ),
                  ),
                  trailing: Icon(paymentIcons[index], color:Color(0xFFFF8084) ),
                );
              },
              separatorBuilder: (context, index) {
                return Divider();
              },
            ),
          ),
       Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                child:SingleChildScrollView(
                   child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.account_circle,
                          color: Colors.black,
                        ),
                        fillColor: Colors.grey[300],
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
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.email,
                          color: Colors.black,
                        ),
                        fillColor: Colors.grey[300],
                        filled: true,
                        hintText: 'Adress',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                      ),),
                    SizedBox(
                      height: 10,
                    ),

                    TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.message,
                          color: Colors.black,
                        ),
                        fillColor: Colors.grey[300],
                        filled: true,
                        hintText: 'Card info',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                      ),),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),),
      Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.symmetric(vertical:  24.0),
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: FlatButton(
            padding: EdgeInsets.symmetric(vertical:10.0 ,),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)),
            color:Color(0xFFFF8084) ,
            textColor: Color(0xFFFFFFFF),
            highlightColor:Colors.transparent ,
            onPressed: (){
              Fluttertoast.showToast(msg: "Payment successfully");
            },

            child: Text('Pay'),
          )),



        ],
      ),
    )])));
  }
}
class HeaderLabel extends StatelessWidget {
  final String headerText;
  const HeaderLabel({
    required this.headerText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Text(
        headerText,
        style: TextStyle(color: Colors.black, fontSize: 28.0),
      ),
    );
  }
}


class DefaultButton extends StatelessWidget {
  late final String btnText;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(vertical:  24.0),
      padding: EdgeInsets.symmetric(horizontal: 24.0),
      child: FlatButton(
        padding: EdgeInsets.symmetric(vertical:10.0 ,),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0)),
        color:Color(0xFFFF8084) ,
        textColor: Color(0xFFFFFFFF),
        highlightColor:Colors.transparent ,
        onPressed: (){},

       child: Text(btnText.toUpperCase()),
    ));
  }
}