import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'about.dart';
import 'checkout.dart';
import 'contact.dart';
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'First App',
    home:Home (),
  ));
}

class Home extends StatelessWidget {
  Widget _buildSingleFeature({context,
    required String foodTitle,
    required String foodsubTitle,
    required String rating ,
    required String price,
    required String image,
  }){
     return Stack(alignment: Alignment.topRight,
        children:[
          Padding(
            padding: const EdgeInsets.only(top: 10,right: 40),
            child:
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              height: 210,
              width: 190,

              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(foodTitle,style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w900
                  ),),
                  Text(foodsubTitle,style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey
                  ),),
                  Container(
                    height: 50,
                    child:Row(
                      children: [
                        Icon(Icons.star,color:Colors.yellow[600]
                        ),
                        SizedBox(
                          width:10 ,
                        ),
                        Text('$rating Ratings',style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey
                        ),),
                        SizedBox(
                          width:10 ,
                        ),
                        Text('\$$price',style: TextStyle(
                            fontSize: 16,
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.bold

                        ),),
                      ],
                    ) ,
                  ),
                ],
              ),
            ),),
          Positioned(child:
          CircleAvatar(
            maxRadius: 60,
            backgroundColor: Colors.white,
            backgroundImage: AssetImage('images/$image'),
          ),)
        ]
    );
  }
  Widget _buildSingleCategory({required String image ,required String name}){
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
      ),
      child: Container(
        height: 200,
        width: 180,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 120,
              width: 120,
              child:
                SingleChildScrollView(
                  child:SingleChildScrollView(
                child: SingleChildScrollView(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 80,
                    decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage('images/$image'))
                    ),
                  ),
                  Text(name,style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900
                  ),)
                ],
              ),
            )
            )))],
        ),
      ),
    );
  }
  Widget _buildFeatureProduct(context) {
    return SingleChildScrollView(
        child:
       Expanded(
      child: Container(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 240,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      height: 240,

                      child: Row(
                        children: [
                          _buildSingleFeature(foodTitle:'Pasta Cheese',
                              foodsubTitle: 'Shelter'
                              , rating:'4.6' ,
                              price: '50', image: 'pastacheese.png'),
                          _buildSingleFeature(foodTitle:'Chicken Brost',
                              foodsubTitle: 'Shelter'
                              , rating:'5.5' ,
                              price: '80', image: 'chickenbrost.png'),
                          _buildSingleFeature(foodTitle:'Meal',
                              foodsubTitle: 'Shelter'
                              , rating:'5.5' ,
                              price: '150', image: 'imageslider1.jpg'),
                          _buildSingleFeature(foodTitle:'Sambousek',
                              foodsubTitle: 'Shelter'
                              , rating:'5.5' ,
                              price: '70', image: 'images9.jpg'),
                          _buildSingleFeature(foodTitle:'chicken Grill',
                              foodsubTitle: 'Shelter'
                              , rating:'5.5' ,
                              price: '50', image: 'images4.jpg'),
                          _buildSingleFeature(foodTitle:'Kentucky Fried Chicken',
                              foodsubTitle: 'Shelter'
                              , rating:'5.5' ,
                              price: '100', image: 'images 12.jpg'),

                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }

  Widget _buildMyDrawer(context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (ctx) => Home(),
                ),
              );
            },
            leading: Icon(
              Icons.home,
              size: 30,
              color:Colors.pinkAccent,
            ),
            title: Text("HomePage"),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (ctx) => ContactScreen(),
                ),
              );
            },
            leading: Icon(
              Icons.contact_phone,
              color:Colors.pinkAccent,
              size: 30,
            ),
            title: Text("Contact Us"),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (ctx) => About(),
                ),
              );
            },
            leading: Icon(
              Icons.info,
              size: 30,
              color:Colors.pinkAccent,
            ),
            title: Text("About Page"),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (ctx) =>CartApp (),
                ),
              );
            },
            leading: Icon(
              Icons.shopping_cart,
              size: 30,
              color:Colors.pinkAccent,
            ),
            title: Text("Order"),
          ),

        ],
      ),
    );
  }
  Widget _buildTopPart(context){
    return Expanded(child:
    Container(
      child: Container(
          child:Column(
              children: [
                Container(
                  margin:EdgeInsets.symmetric(horizontal: 20,vertical: 20) ,
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(icon: Icon(Icons.sort,size: 35,color: Colors.white,),
                          onPressed: (){
                            _scaffoldKey.currentState!.openDrawer();
                          } ),
                    ],

                  ),

                ),
                Expanded(child:
                Container(
                  child:SingleChildScrollView(
                    child:Column(mainAxisAlignment: MainAxisAlignment.center,
                      children:[
                        Container(
                            height: 120,
                            padding: EdgeInsets.symmetric(vertical: 20),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  maxRadius: 45,
                                  backgroundColor: Colors.white,
                                  child:CircleAvatar(
                                    backgroundColor: Colors.white,
                                    maxRadius: 40,
                                    backgroundImage: AssetImage('images/pastacheese.png'),

                                  ) ,),
                                Container(
                                  height: 80,
                                  width: 180,
                                  child: ListTile(
                                    title: Text('Shelter',
                                      style: TextStyle(
                                          fontSize: 21,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    subtitle:Text('Yumyyyyy',
                                      style: TextStyle(
                                          fontSize: 21,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold
                                      ),) ,
                                  ),
                                )
                              ],))
                      ]
                  ),
                )))])),
      color: Colors.pinkAccent[200],

    ));
  }
  Widget _buildBottomPart(context) {
    return Expanded(
        flex: 2,
        child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
                 color: Color(0xfff2f3f4),
               child:SingleChildScrollView(
                 child: Column(
                 children: [
                    Container(
                        width: double.infinity,
                       height: 200,
                          child: Column(
                                 mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                            SingleChildScrollView(
                                 scrollDirection: Axis.horizontal,
                               child: Container(
                               height: 200,
                                 child: Row(
                                   children: [
                                  _buildSingleCategory(
                                     name:'Pizza',image: 'pizza.png'
    ),
                                  _buildSingleCategory(
                                  name:'Salad',image: 'salad.png'
    ),
                                   _buildSingleCategory(
                                    name:'Barger',image: 'bargar.png'
                                        ),
                                     _buildSingleCategory(
                                         name:'chicken Grill',image: 'images6.jpg'
                                     ),
                                     _buildSingleCategory(
                                         name:'kofta',image: 'images7.jpg'
                                     ),
                                     _buildSingleCategory(
                                         name:'macaroni',image: 'images (8).jpg'
                                     ),
                                     _buildSingleCategory(
                                         name:'Grilled grill chicken',image: 'images13.jpg'
                                     )
                                   ],

    ),
    ),
    ),
    ],
    ),

    ),
                        Container(
                                width: double.infinity,
                          child: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Featured',
                           style: TextStyle(
                            fontSize: 25,
                             color: Colors.blueAccent,
                             fontWeight: FontWeight.w900
                           ),),
                               RaisedButton(color: Color(0xfff2f3f4) ,
                                 onPressed: (){
                                 Navigator.of(context).pushReplacement(
                                   MaterialPageRoute(
                                     builder: (ctx) => CartApp(),),);
                               },
                                 child: Text('View all',style: TextStyle(
                             fontSize: 25,
                             color: Colors.blueAccent,
                             fontWeight: FontWeight.w900
    ),),)
    ],
    ),
     ),
                   SizedBox(
                     height: 10,
                   ),
                   _buildFeatureProduct(context),
      ]))));
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: _buildMyDrawer(context),
      body:SafeArea(child:Container(
        child:Column(
          children: [
            _buildTopPart(context),
            _buildBottomPart(context),
                  ],
                ),)
                ),

    );

  }
}
