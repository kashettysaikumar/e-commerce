import 'package:flutter/material.dart';

import '../database/db.helper.dart';
import '../model/cartmodel.dart';


class Favorites_Screen extends StatefulWidget {
 /* List<dynamic> image;
  String title;
  String description;
  String brand;
  int price;
  int id;
  String category;
  int stock;
  String thumbnail;

  Favorites_Screen({
    required this.image,
    required this.title,
    required this.description,
    required this.brand,
    required this.price,
    required this.id,
    required this.category,
    required this.stock,
    required this.thumbnail,
  });*/
  @override
  State<Favorites_Screen> createState() => _Favorites_ScreenState();
}

class _Favorites_ScreenState extends State<Favorites_Screen> {
  DBHelper? dbHelper = DBHelper();
  late List<dynamic> image;

  /*List ImageList = [
    "assets/image1.jpg",
    "assets/image2.jpg",
    "assets/image3.jpg",
    "assets/image4.jpg",

  ];
  List productTitles = [
    "Warm Zipper",
    "Knitted Woo!",
    "Zipper Win",
    "Child Win",
  ];

  List prices = [
    "\$300",
    "\$380",
    "\$130",
    "\$700",
  ];

  List reviews = [
    "54",
    "129",
    "520",
    "534",
  ];
  List<String> images = [
    "assets/image1.jpg",
    "assets/image2.jpg",
    "assets/image3.jpg",
    "assets/image4.jpg",
    "assets/image5.jpg",
  ];*/




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Wishlist"),
        leading: BackButton(),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child:FutureBuilder(
            future: dbHelper?.getfavoriteList(),
           // builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
             builder: (context, AsyncSnapshot<List<cartitems>> snapshot) {
              if (snapshot.hasData){
                return GridView.builder(
                  itemCount: snapshot.data!.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.6,
                    //crossAxisSpacing: 40,
                  ),
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 2,
                      color: Color(0xfff8eae0),
                      child: Container(
                        width: 200,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 220,
                              child: Stack(
                                children: [
                                  InkWell(
                                    onTap: () {},
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(snapshot.data![index].thumbnail,
                                        width: 170,
                                        fit: BoxFit.fill,
                                        height: 200,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    right: 10,
                                    top: 10,
                                    child: Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: InkWell(
                                        onTap: (){
                                          setState(() {
                                            dbHelper!.favdelete(
                                                snapshot.data![index].id);
                                            print(snapshot.data![index].id);
                                          });

                                        },
                                        child: Center(
                                          child: Icon(
                                            Icons.delete,
                                            color: Color(0xFFDB3022),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 10),
                           Text(snapshot.data![index].brand.toString(),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 20),
                            Row(
                              children: [
                               Padding(
                                 padding:EdgeInsets.all(5.0),
                                 child: Text("Stock",style: TextStyle(
                                   color: Colors.black,
                                   fontWeight: FontWeight.bold,
                                   fontSize: 16,
                                 ),
                                 ),
                               ),
                                Text(
                                  '(' + snapshot.data![index].stock.toString()+ ')',
                                  style: TextStyle(color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                                ),
                                SizedBox(width: 20),
                                Text(
                                  snapshot.data![index].price.toString()
                                ),

                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
              return CircularProgressIndicator();
              },

          ),
        ),
      ),
    );
  }
}
