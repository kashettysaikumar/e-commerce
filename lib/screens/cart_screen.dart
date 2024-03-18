import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_shopping/model/cartmodel.dart';
import 'package:online_shopping/screens/home_screen.dart';
import 'package:online_shopping/screens/payment_method_screen.dart';
import 'package:online_shopping/screens/product_screen.dart';
import 'package:online_shopping/widgets/container_button_modal.dart';
import 'package:provider/provider.dart';

import '../database/cart_provider.dart';
import '../database/db.helper.dart';
import 'navigation_screen.dart';

class CartScreen extends StatefulWidget {
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  DBHelper? dbHelper = DBHelper();
  int quantity = 1;
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
  ];*/

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart Screen"),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(children: [
        FutureBuilder(
            future: cart.getData(),
            builder: (context, AsyncSnapshot<List<cartitems>> snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data!.isNotEmpty)
                  return Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.all(15),
                        child: Column(
                          children: [
                            Container(
                              child: ListView.builder(
                                //itemCount: ImageList.length,
                                itemCount: snapshot.data!.length,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return Card(
                                    elevation: 2,
                                    color: Color(0xfff8eae0),
                                    child: Container(
                                      margin: EdgeInsets.symmetric(vertical: 15),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              dbHelper!.delete(
                                                  snapshot.data![index].id);
                                              cart.removeCounter();
                                              cart.removeTotalprice(double.parse(
                                                  snapshot.data![index].price
                                                      .toString()));
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.only(left:10),
                                              child: Icon(
                                                Icons.delete,
                                                color: Color(0xFFDB3022),
                                              ),
                                            ),
                                          ),
                                          /*Checkbox(
                                    splashRadius: 20,
                                    activeColor: Color(0xFFDB3022),
                                    value: true,
                                    onChanged: (val) {},
                                ),*/
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            child: Image.network(
                                              snapshot.data![index].thumbnail,
                                              /*ImageList[index],*/
                                              height: 100,
                                              width: 100,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: 120,
                                                height: 60,
                                                child: Padding(
                                                  padding: const EdgeInsets.only(left: 8.0),
                                                  child: Text(
                                                    snapshot.data![index].title,
                                                    maxLines: 2,
                                                    style: TextStyle(
                                                      color: Colors.black87,
                                                      fontWeight: FontWeight.w900,
                                                      fontSize: 18,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 10),
                                              Padding(
                                                padding: const EdgeInsets.only(left:2),
                                                child: Text(
                                                  snapshot.data![index].brand,
                                                  style: TextStyle(
                                                    color: Colors.black26,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 10),
                                              Text(
                                                snapshot.data![index].price
                                                    .toString(),
                                                style: TextStyle(
                                                  color: Color(0xFFDB3022),
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w900,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  quantity = snapshot
                                                      .data![index].quantity!;
                                                  int price = snapshot
                                                      .data![index].initialPrice!;
                                                  quantity--;
                                                  int? newprice =
                                                      price * quantity;
                                                  if (quantity > 0) {
                                                    dbHelper
                                                        ?.updateQuantity(cartitems(
                                                            id: snapshot
                                                                .data![index].id,
                                                            title: snapshot
                                                                .data![index]
                                                                .title,
                                                            description: snapshot
                                                                .data![index]
                                                                .description,
                                                            initialPrice: snapshot
                                                                .data![index]
                                                                .initialPrice!,
                                                            price: newprice,
                                                            brand: snapshot
                                                                .data![index]
                                                                .brand,
                                                            category: snapshot
                                                                .data![index]
                                                                .category,
                                                            stock: snapshot
                                                                .data![index]
                                                                .stock,
                                                            quantity: quantity,
                                                            thumbnail: snapshot
                                                                .data![index]
                                                                .thumbnail))
                                                        .then((value) {
                                                      newprice = 0;
                                                      quantity = 0;
                                                      cart.removeTotalprice(
                                                          double.parse(snapshot
                                                              .data![index]
                                                              .initialPrice!
                                                              .toString()));
                                                    }).onError(
                                                            (error, stackTrace) {
                                                      print(error.toString());
                                                    });
                                                  }
                                                },
                                                child: Padding(
                                                  padding: const EdgeInsets.only(left:15),
                                                  child: Icon(
                                                    CupertinoIcons.minus,
                                                    color: Colors.green,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(width: 20),
                                              Text(
                                                snapshot.data![index].quantity
                                                    .toString(),
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                              SizedBox(width: 5),
                                              InkWell(
                                                onTap: () {
                                                  quantity = snapshot
                                                      .data![index].quantity!;
                                                  int price = snapshot
                                                      .data![index].initialPrice!;
                                                  quantity++;
                                                  int? newprice =
                                                      price * quantity;

                                                  dbHelper
                                                      ?.updateQuantity(cartitems(
                                                          id: snapshot
                                                              .data![index].id,
                                                          title: snapshot
                                                              .data![index].title,
                                                          description: snapshot
                                                              .data![index]
                                                              .description,
                                                          initialPrice: snapshot
                                                              .data![index]
                                                              .initialPrice!,
                                                          price: newprice,
                                                          brand: snapshot
                                                              .data![index].brand,
                                                          category: snapshot
                                                              .data![index]
                                                              .category,
                                                          stock: snapshot
                                                              .data![index].stock,
                                                          quantity: quantity,
                                                          thumbnail: snapshot
                                                              .data![index]
                                                              .thumbnail))
                                                      .then((value) {
                                                    newprice = 0;
                                                    quantity = 0;
                                                    cart.addTotalPrice(
                                                        double.parse(snapshot
                                                            .data![index]
                                                            .initialPrice!
                                                            .toString()));
                                                  }).onError((error, stackTrace) {
                                                    print(error.toString());
                                                  });
                                                },
                                                child: Padding(
                                                  padding: const EdgeInsets.only(right:10),
                                                  child: Icon(
                                                    CupertinoIcons.plus,
                                                    color: Color(0xFFDB30220),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            SizedBox(height: 30),
                            /*Divider(
                              height: 20,
                              thickness: 1,
                              color: Colors.black,
                            ),
                            Consumer<CartProvider>(
                                builder: (context, value, child) {
                              return Visibility(
                                visible:
                                    value.getTotalPrice().toStringAsFixed(2) ==
                                            "0.00"
                                        ? false
                                        : true,
                                child: Column(
                                  children: [
                                    ReusableWidget(
                                      title: "Total Price",
                                      value: r'$' +
                                          value
                                              .getTotalPrice()
                                              .toStringAsFixed(2),
                                    )
                                  ],
                                ),
                              );
                            }),*/

                            /*Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Select All",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                 Checkbox(
                                   splashRadius: 20,
                                  activeColor: Color(0xFFDB3022),
                                   value: false,
                                  onChanged: (val) {},
                                 ),
                              ],
                            ),*/
                            /*Divider(
                              height: 20,
                              thickness: 1,
                              color: Colors.black,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Total Payment",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  "\$300.50",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w900,
                                    color: Color(0xFFDB3022),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 30),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          PaymentMethodScreen(),
                                    ));
                              },
                              child: ContainerButtonModel(
                                itext: "Checked",
                                containerWidth:
                                    MediaQuery.of(context).size.width,
                                bgColor: Color(0xFFDB3022),
                              ),
                            ),
                            SizedBox(height: 30),*/
                          ],
                        ),
                      ),
                    ),
                  );
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 60),
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.4,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage("assets/Empty.png"),
                    )),
                  ),
                  Text(
                    "Your Bag Is Empty!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color(0xFFDB3022),
                        fontSize: 32,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 30),
                  Text(
                    "Looks Like You didn\'t \n"
                    " add anything to your cart yet",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black45,
                        fontSize: 26,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 30),
                  Container(
                    width: MediaQuery.of(context).size.height * 0.4,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NavigationScreen(),
                            ));
                      },
                      child: Text(
                        "Continue Shopping",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size.fromHeight(55),
                        backgroundColor: Color(0xFFDB3022),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }),
        /*Divider(
          height: 20,
          thickness: 1,
          color: Colors.black,
        ),*/
        SizedBox(height: 5),
        Consumer<CartProvider>(builder: (context, value, child) {
          return Visibility(
            visible: value.getTotalPrice().toStringAsFixed(2) == "0.00"
                ? false
                : true,
            child: Column(
              children: [
                ReusableWidget(
                  title: "Total Price",
                  value: r'$' + value.getTotalPrice().toStringAsFixed(2),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PaymentMethodScreen(),
                          ));
                    },
                    child: Text(
                      "Proceed to Payment",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size.fromHeight(55),
                      backgroundColor: Color(0xFFDB3022),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
        SizedBox(height: 30),
      ]),
    );
  }
}

class ReusableWidget extends StatelessWidget {
  final String title, value;

  const ReusableWidget({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(
            value.toString(),
            style: TextStyle(
                color: Colors.red, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
