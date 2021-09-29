import 'package:flutter/material.dart';
import 'package:food_app1/pay.dart';

import 'Home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(

        ),
        home: CartApp()
    );
  }
}

class CartApp extends StatefulWidget {
  @override
  _CartAppState createState() => _CartAppState();
}

class _CartAppState extends State<CartApp> {
  List<ProductModel> cart = [];
  int sum = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
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
          backgroundColor: Colors.pinkAccent,
          bottom: TabBar(
            tabs: <Widget>[
              Tab(text: "Products",),
              Tab(text: "Checkout",),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            ProductScreen((selectedProduct){
              setState(() {
                cart.add(selectedProduct);//update
                sum = 0;
                cart.forEach((item){
                  sum = sum + item.price!;
                });
              });
            }),
            CheckoutScreen(cart, sum),
          ],
        ),
      ),
    );
  }
}

class ProductScreen extends StatelessWidget {
  final ValueSetter<ProductModel> _valueSetter;

  ProductScreen(this._valueSetter);

  List<ProductModel> products = [ProductModel("Burger min size", 50),
    ProductModel("pizza small ", 50),
    ProductModel("pizza large ", 100),
    ProductModel("3Chicken breast piece & rice &salad",150 ),
    ProductModel(" koky",20),
    ProductModel("salad & kofta and rice",100),
    ProductModel("meat & rice",70 ),
    ProductModel("Burger small",55 ),
    ProductModel("Burger large ",80),
    ProductModel("salad", 40),


  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(products[index].name!,style: TextStyle(fontSize: 20),),
            trailing: Text(
              "\$${products[index].price}",
              style: TextStyle(
                  color: Colors.redAccent,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            ),
            onTap: () {
              _valueSetter(products[index]);
            },
          );
        },
        separatorBuilder: (context, index) {
          return Divider();
        },
        itemCount: products.length);
  }
}

class CheckoutScreen extends StatelessWidget {
  final cart;
  final sum;

  CheckoutScreen(this.cart, this.sum);

  @override
  Widget build(BuildContext context) {
    return Container(
    child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ListView.separated(
            itemBuilder: (context, index){
              return ListTile(
                title: Text(cart[index].name,style: TextStyle(fontSize: 19),)
                ,trailing: Text("\$${cart[index].price}", style: TextStyle(color: Colors.redAccent, fontSize: 25, fontWeight: FontWeight.w500),),
                onTap: (){

                },
              );
            },
            separatorBuilder: (context, index){
              return Divider();
            },
            itemCount: cart.length,
            shrinkWrap: true,
          ),
          Divider(),
          Text("Total : \$$sum",style:TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.black),),
         SizedBox(height: 10,),
         Column(mainAxisAlignment: MainAxisAlignment.center,
             children:[ Container(
                 padding: EdgeInsets.only(left:150),
                 child: RaisedButton(
                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                   color: Colors.pinkAccent,
                   child: Text(
                     'Order',
                     style: TextStyle(color: Colors.white, fontSize: 30),
                   ),
                   onPressed:() {
                     Navigator.of(context).pushReplacement(
                       MaterialPageRoute(
                         builder: (ctx) => Payment(),),);
                   },
                 ))])


        ],
      ),
    );
  }
}
/* IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            names.removeAt(index);*/
class ProductModel{
  String? name;
  int? price;


  ProductModel(String name, int price){
    this.name = name;
    this.price = price;
  }
}
