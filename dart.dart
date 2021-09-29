import 'package:flutter/material.dart';
import 'package:awesome_card/awesome_card.dart';
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'First App',
    home:  PaymentDetails(),
  ));
}

class PaymentDetails extends StatefulWidget {
  @override
  _PaymentDetailsState createState() => _PaymentDetailsState();
}

class _PaymentDetailsState extends State<PaymentDetails> {
  String cardNumber = "5450 7879 4864 7854",
      cardExpiry = "10/25",
      cardHolderName = "HaNAA MOHAMED",
      bankName = "ICICI Bank",
      cvv = "456";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      appBar:AppBar(
        title: Text('Payment Details', style: TextStyle(color:  Color(0xFFFF8084))),
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            CreditCard(
              cardNumber: cardNumber,
              cardExpiry: cardExpiry,
              cardHolderName: cardHolderName,
              bankName: bankName,
              cvv: cvv,
              // showBackSide: true,
              frontBackground: CardBackgrounds.black,
              backBackground: CardBackgrounds.white,
              cardType: CardType.masterCard,
              showShadow: true,
            ),Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(
          left:24.0 ,
          top: 16.0 ,
        ),
        child: Text("Card Information",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
          ),
        ),
      ),

            SizedBox(height: 8.0),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 24.0),
              decoration: BoxDecoration(
                color: Color(0xFFFFFFFF),
                border: Border.all(
                  width: 0.5,
                  color: Color(0xFF808080),
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24.0,
                      vertical: 8.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("My Perosnal Card",
                            style: TextStyle(fontSize: 18.0)),
                        Container(
                            width: 60.0,
                            child: Icon(Icons.payment,
                                color:  Color(0xFFFF8084), size: 40.0)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Card Number",
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Color(0xFF808080) ,
                              ),
                            ),
                            Text(
                              cardNumber,
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ],
                        ),
                        Container(
                          width: 45.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Exp.",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Color(0xFF808080) ,
                                ),
                              ),
                              Text(
                                cardExpiry,
                                style: TextStyle(fontSize: 16.0),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24.0,
                      vertical: 8.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Card Name",
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Color(0xFF808080) ,
                              ),
                            ),
                            Text(
                              cardHolderName,
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ],
                        ),
                        Container(
                          width: 45.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "CVV",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Color(0xFF808080) ,
                                ),
                              ),
                              Text(
                                cvv,
                                style: TextStyle(fontSize: 16.0),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 48.0,
                    width: MediaQuery.of(context).size.width,
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0),
                        ),
                      ),
                      color:  Color(0xFF303030).withOpacity(0.2),
                      child: Text(
                        "Edit Detail",
                        style: TextStyle(fontSize: 16.0),
                      ),
                      onPressed: () => print("Edit Detail"),
                    ),
                  ),
                ],
              ),
            ),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(
              left: 24.0,
              top: 16.0,
            ),
            child: Text("Transaction Details",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
              ),
            ),
          ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              decoration: BoxDecoration(
                color: Color(0xFFFFFFFF),
                border: Border.all(
                  width: 0.5,
                  color:  Color(0xFF808080),
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: paymentDetailList.length,
                itemBuilder: (context, index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        paymentDetailList[index].date,
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Color(0xFF808080),
                        ),
                      ),
                      Container(
                        width: 190.0,
                        child: Text(
                          paymentDetailList[index].details,
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ),
                      Container(
                        width: 70.0,
                        child: Text(
                          "\$ ${paymentDetailList[index].amount}",
                          style: TextStyle(
                            fontSize: 16.0,
                            color: paymentDetailList[index].textColor,
                          ),
                        ),
                      ),
                    ],
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider(
                    thickness: 0.5,
                    color: Color(0xFF808080) ,
                  );
                },
              ),
            ),
            SizedBox(height: 8.0),
          ],
        ),
      ),
    );
  }
}
final paymentDetailList = [
  PaymentModal(
      date: "Jan 01",
      details: "Buy IPhoneX",
      amount: 1000.0,
      textColor: Colors.red),
  PaymentModal(
      date: "Aug 15",
      details: "Flat ₹650 off",
      amount: 650.0,
      textColor: Colors.green),
  PaymentModal(
      date: "Dec 03",
      details: "Congrats! Flat ₹180",
      amount: 180.0,
      textColor: Colors.green),
  PaymentModal(
      date: "Feb 14",
      details: "Buy Shoes Upto 50% Off",
      amount: 540.0,
      textColor: Colors.red),
  PaymentModal(
      date: "Sep 08",
      details: "Buy Footwear on Discount",
      amount: 210.0,
      textColor: Colors.red),
  PaymentModal(
      date: "Apr 18",
      details: "Congrats! ₹375 Rewarded",
      amount: 375.0,
      textColor: Colors.green),
];
class PaymentModal {
 late  String date;
late   String details;
 late  double amount;
 late Color textColor;

  PaymentModal({required this.date, required this.details, required this.amount, required this.textColor});

    PaymentModal.fromJson(Map<String, dynamic> json) {
      date = json['date'];
    details = json['details'];
    amount = json['amount'];
    textColor = json['textColor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['details'] = this.details;
    data['amount'] = this.amount;
    data['textColor'] = this.textColor;
    return data;
  }
}
