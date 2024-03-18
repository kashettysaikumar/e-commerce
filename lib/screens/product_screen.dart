import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:online_shopping/database/cart_provider.dart';
import 'package:online_shopping/model/cartmodel.dart';
import 'package:online_shopping/screens/payment_method_screen.dart';
import 'package:provider/provider.dart';

import '../database/db.helper.dart';
import '../widgets/container_button_modal.dart';
import 'cart_screen.dart';
import 'package:badges/badges.dart' as badge;

class ProductScreen extends StatefulWidget {
  List<dynamic> image;
  String title;
  String description;
  String brand;
  int price;
  int id;
  String category;
  int stock;
  String thumbnail;

  ProductScreen({
    required this.image,
    required this.title,
    required this.description,
    required this.brand,
    required this.price,
    required this.id,
    required this.category,
    required this.stock,
    required this.thumbnail,
  });

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  DBHelper dbHelper = DBHelper();

  /*List<String> images = [
    "assets/image1.jpg",
    "assets/image2.jpg",
    "assets/image3.jpg",
    "assets/image4.jpg",
    "assets/image5.jpg",
  ];*/
  List<String> images = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //images = widget.image as List<String>;
    for (int i = 0; i <= widget.image.length - 1; i++) {
      images.add(widget.image[i]);
    }
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Product Overview"),
        leading: BackButton(),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
      actions: [
         InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => CartScreen()),);
            },
            child: Container(
              margin: EdgeInsets.all(18),
              child: badge.Badge(
                badgeContent: Consumer<CartProvider>(
                  builder: (context, value, child){
                    return  Text(value.getCounter().toString(),style: TextStyle(color: Colors.white),);
                  },
                ),
                child: Icon(
                Icons.shopping_cart_outlined,
                color: Color(0xFFDB3022),
              ),
              ),
            ),
          ),

      ],
      ),

      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 450,
                    width: MediaQuery.of(context).size.width,
                    child: FanCarouselImageSlider(
                      sliderHeight: 430,
                      imageFitMode: BoxFit.cover,
                      imagesLink: images,
                      isAssets: false,
                      initalPageIndex: 0,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 30),
                          SizedBox(
                            width: 280,
                            child: Text(
                              widget.title,
                              maxLines: 2,
                              style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.w900,
                                fontSize: 25,
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            widget.brand,
                            style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "\$ ${widget.price.toString()}",
                        /*"\$300.00",*/
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          overflow: TextOverflow.ellipsis,
                          color: Color(0xffdb3022),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: RatingBar.builder(
                      initialRating: 3,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemSize: 25,
                      itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                  ),
                  SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      widget.description,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            color: Color(0x1f989797),
                          ),
                          child: InkWell(
                            onTap: () {
                              dbHelper
                                  .insert(cartitems(
                                      id: widget.id,
                                      title: widget.title,
                                      description: widget.description,
                                      price: widget.price,
                                      brand: widget.brand,
                                      category: widget.category,
                                      stock: widget.stock,
                                      thumbnail: widget.thumbnail,
                                      quantity:1,
                                      initialPrice:widget.price

                              ))
                                  .then((value) {
                                print("product is added to cart");
                                cart.addTotalPrice(double.parse(widget.price.toString()));
                                cart.addCounter();
                              }).onError((error, stackTrace) {
                                print(error.toString());
                              });
                              /*Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CartScreen(),
                                  ));*/
                            },
                            child: Center(
                              child: Icon(
                                Icons.shopping_cart,
                                color: Color(0xFFDB3022),
                              ),
                            ),
                          ),
                       ),
                      Container(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PaymentMethodScreen(),
                                ));
                          },
                          child: ContainerButtonModel(
                            containerWidth:
                                MediaQuery.of(context).size.width / 1.5,
                            itext: "Buy Now",
                            bgColor: Color(0xFFDB3022),
                          ),
                        ),
                      )
                    ],
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
