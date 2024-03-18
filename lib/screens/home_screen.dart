import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:online_shopping/database/cart_provider.dart';
import 'package:online_shopping/model/cartmodel.dart';
import 'package:online_shopping/screens/cart_screen.dart';
import 'package:online_shopping/screens/favorites_screen.dart';
import 'package:online_shopping/screens/product_screen.dart';
import 'package:badges/badges.dart' as badge;
import 'package:provider/provider.dart';
import '../database/db.helper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DBHelper? dbHelper = DBHelper();

  var stringResponse;
  late Map mapResponse;
  late Map dataResponse;
  var listResponse;
  List<dynamic> data = [];
  var products;
  var search = TextEditingController();

  //var category;
  List<String> category = [];
  var isloading = false;

  Future apicall() async {
    http.Response response;
    response = await http.get(Uri.parse('https://dummyjson.com/products'));
    var allcategoryResponse =
    await http.get(Uri.parse("https://dummyjson.com/products/categories"));
    var categoryProduct =
    await http.get(Uri.parse("https://dummyjson.com/products/categories"));

    if (response.statusCode == 200) {
      setState(() {
        isloading = true;
        //stringResponse = response.body;
        mapResponse = json.decode(response.body);
        listResponse = mapResponse['products'];
        print(listResponse);
        //print(listResponse[0]['price'].runtimeType);
        //print(listResponse[0]['description'].runtimeType);
        //print(listResponse[0]['title'].runtimeType);
      });
    }

    if (allcategoryResponse.statusCode == 200) {
      setState(() {
        data = jsonDecode(allcategoryResponse.body) as List<dynamic>;
        print(data);
      });
    }

    if (categoryProduct.statusCode == 200) {
      setState(() {
        products = jsonDecode(categoryProduct.body);
        print(products["product"]);
        var allcategoryproduct = products['products'];
        listResponse = allcategoryproduct;
      });
    }
  }

  Future<void> categoryResponse(String text) async {
    var baseUrl = "https://dummyjson.com/products/category/$text";
    print(baseUrl);
    var response = await http.Client().get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      setState(() {
        var result = jsonDecode(response.body);
        listResponse = result['products'];
      });
    }
  }

  Future<void> searchRespond(String text) async {
    var baseUrl = "https://dummyjson.com/products/search";
    print(baseUrl);

    Map<String, String> queryParams = {
      'q': '$text',
    };

    String query = Uri(queryParameters: queryParams).query;
    var result = baseUrl + "?" + query;

    var searchProduct = await http.Client().get(Uri.parse(result));
    if (searchProduct.statusCode == 200) {
      setState(() {
        var searchproduct = jsonDecode(searchProduct.body);
        listResponse = searchproduct['products'];
      });
    }
  }

  @override
  void initState() {
    apicall();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Visibility(
        replacement: Center(child: CircularProgressIndicator()),
        visible: isloading,
        child: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.only(left: 15, right: 15, top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.all(5),
                        height: 50,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width / 1.5,
                        decoration: BoxDecoration(
                          color: Colors.black12.withOpacity(0.05),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12.withOpacity(0.05),
                              blurRadius: 2,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: TextField(
                          controller: search,
                          decoration: InputDecoration(
                              prefixIcon: InkWell(
                                onTap: () {
                                  searchRespond(search.text.toString());
                                  print(search.text.toString());
                                },
                                child: Icon(
                                  Icons.search,
                                  color: Color(0xFFDB3022),
                                ),
                              ),
                              border: InputBorder.none,
                              hintText: "Find your Product"
                          ),
                        ),
                      ),
                      Container(
                        height: 50,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width / 6,
                        decoration: BoxDecoration(
                          color: Colors.black12.withOpacity(0.05),
                          borderRadius: BorderRadius.circular(10),
                          /*boxShadow: [
                            BoxShadow(
                              color: Colors.black12.withOpacity(0.05),
                              blurRadius: 2,
                              spreadRadius: 1,
                            ),
                          ],*/
                        ),
                        child: Center(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CartScreen()),
                              );
                            },
                            child: badge.Badge(
                              badgeContent: Consumer<CartProvider>(
                                builder: (context, value, child) {
                                  return Text(
                                    value.getCounter().toString(),
                                    style: TextStyle(color: Colors.white),
                                  );
                                },
                              ),
                              child: Icon(
                                Icons.shopping_cart_outlined,
                                color: Color(0xFFDB3022),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Container(
                    height: 150,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    decoration: BoxDecoration(
                      // color: Color(0xfffff0dd),
                      color: Color(0xfff8eae0),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Image.asset('assets/freed.png'),
                  ),
                  SizedBox(height: 20),
                  !isloading
                      ? Center(
                    child: CircularProgressIndicator(),
                  )
                      : Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 50,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: data.length,
                            itemBuilder: (context, index) {
                              return FittedBox(
                                child: Container(
                                  height: 40,
                                  margin: EdgeInsets.all(8),
                                  padding: EdgeInsets.only(
                                      left: 15, right: 15),
                                  decoration: BoxDecoration(
                                    color:
                                    Colors.black12.withOpacity(0.05),
                                    borderRadius:
                                    BorderRadius.circular(20),
                                  ),
                                  child: Center(
                                    child: FittedBox(
                                      child: InkWell(
                                        onTap: () {
                                          categoryResponse(data[index]);
                                        },
                                        child: Text(
                                          data[index],
                                          //category[index],
                                          // listResponse[index]['category'].toString(),
                                          style: TextStyle(
                                            color: Colors.black26,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          height: 190,
                          child: ListView.builder(
                            itemCount: listResponse.length,
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Card(
                                elevation: 2,
                                color: Color(0xfff8eae0),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    height: 300,
                                    width: 320,
                                    margin: EdgeInsets.only(right: 15),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                          const EdgeInsets.all(8.0),
                                          child: SizedBox(
                                            height: 180,
                                            width: 170,
                                            child: Stack(
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              ProductScreen(
                                                                  image: listResponse[index][
                                                                  'images'],
                                                                  title: listResponse[index][
                                                                  'title'],
                                                                  description:
                                                                  listResponse[index][
                                                                  'description'],
                                                                  brand: listResponse[index][
                                                                  'brand'],
                                                                  price: listResponse[index][
                                                                  'price'],
                                                                  id: listResponse[index]
                                                                  ['id'],
                                                                  category: listResponse[index][
                                                                  'category'],
                                                                  stock: listResponse[index]
                                                                  ['stock'],
                                                                  thumbnail: listResponse[index]['thumbnail']),
                                                        ));
                                                  },
                                                  child: ClipRRect(
                                                    borderRadius:
                                                    BorderRadius
                                                        .circular(10),
                                                    child: Image.network(
                                                      listResponse[index]
                                                      ['images'][0],
                                                      fit: BoxFit.cover,
                                                      height: 170,
                                                      width: 160,
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                  right: 20,
                                                  top: 10,
                                                  child: Container(
                                                    height: 30,
                                                    width: 30,
                                                    decoration:
                                                    BoxDecoration(
                                                      color: Color(
                                                          0xFFFACDC9),
                                                      borderRadius:
                                                      BorderRadius
                                                          .circular(
                                                          20),
                                                    ),
                                                    child: Center(
                                                      child: InkWell(
                                                        onTap: () {
                                                          dbHelper?.insert_fav(
                                                              cartitems(
                                                                //images: listResponse[index]
                                                                //['images'],
                                                                  id: listResponse[index][
                                                                  'id'],
                                                                  title: listResponse[index][
                                                                  'title'],
                                                                  description: listResponse[index][
                                                                  'description'],
                                                                  price: listResponse[index][
                                                                  'price'],
                                                                  brand: listResponse[index][
                                                                  'brand'],
                                                                  category: listResponse[index]
                                                                  [
                                                                  'category'],
                                                                  stock: listResponse[index]
                                                                  [
                                                                  'stock'],
                                                                  thumbnail:
                                                                  listResponse[index]['thumbnail'],
                                                                  totalPrice: 2000));
                                                          Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (
                                                                      context) =>
                                                                      Favorites_Screen()));
                                                        },
                                                        child: Icon(
                                                          Icons.favorite,
                                                          color: Color(
                                                              0xFFDB3022),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                const EdgeInsets.only(
                                                  left: 10,
                                                ),
                                                child: Text(
                                                  listResponse[index]
                                                  ["title"]
                                                      .toString(),
                                                  maxLines: 1,
                                                  overflow: TextOverflow
                                                      .ellipsis,
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                    FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 10),
                                              SizedBox(
                                                width: 120,
                                                child: Text(
                                                  listResponse[index]
                                                  ["description"]
                                                      .toString(),
                                                  maxLines: 4,
                                                  overflow: TextOverflow
                                                      .ellipsis,
                                                ),
                                              ),
                                              SizedBox(height: 10),
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.star,
                                                    color: Colors.amber,
                                                    size: 22,
                                                  ),
                                                  Text(
                                                    '(' +
                                                        listResponse[
                                                        index]
                                                        ['rating']
                                                            .toString() +
                                                        ')',
                                                  ),
                                                  SizedBox(height: 10),
                                                  Text(
                                                    listResponse[index]
                                                    ["price"]
                                                        .toString(),
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                      FontWeight.bold,
                                                      color: Color(
                                                          0xFFDB3022),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(height: 30),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Newest Products",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                        Center(
                          child: GridView.builder(
                            itemCount: listResponse?.length,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 0.6,
                              //crossAxisSpacing: 40,
                            ),
                            itemBuilder: (context, index) {
                              return Card(
                                elevation: 2,
                                color: Color(0xfff8eae0),
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  width: 200,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: 200,
                                          child: Stack(
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            ProductScreen(
                                                                image: listResponse[index]
                                                                [
                                                                'images'],
                                                                title: listResponse[index]
                                                                ['title'],
                                                                description:
                                                                listResponse[index]
                                                                [
                                                                'description'],
                                                                brand: listResponse[index]
                                                                ['brand'],
                                                                id: listResponse[index]
                                                                ['id'],
                                                                price: listResponse[index]
                                                                ['price'],
                                                                category:
                                                                listResponse[index]
                                                                [
                                                                'category'],
                                                                stock: listResponse[index]
                                                                ['stock'],
                                                                thumbnail:
                                                                listResponse[index]
                                                                ['thumbnail']),
                                                      ));
                                                },
                                                child: ClipRRect(
                                                  borderRadius:
                                                  BorderRadius
                                                      .circular(10),
                                                  child: Image.network(
                                                    listResponse[index]
                                                    ['images'][0],
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
                                                  decoration:
                                                  BoxDecoration(
                                                    color:
                                                    Color(0xFFFACDC9),
                                                    borderRadius:
                                                    BorderRadius
                                                        .circular(20),
                                                  ),
                                                  child: Center(
                                                    child: InkWell(
                                                      onTap: () {
                                                        dbHelper?.insert_fav(
                                                            cartitems(
                                                              //images: listResponse[index]
                                                              //['images'],
                                                                id: listResponse[index][
                                                                'id'],
                                                                title: listResponse[index][
                                                                'title'],
                                                                description: listResponse[index][
                                                                'description'],
                                                                price: listResponse[index][
                                                                'price'],
                                                                brand: listResponse[index][
                                                                'brand'],
                                                                category: listResponse[index]
                                                                [
                                                                'category'],
                                                                stock: listResponse[index]
                                                                [
                                                                'stock'],
                                                                thumbnail:
                                                                listResponse[index]['thumbnail'],
                                                                totalPrice: 2000));
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                    Favorites_Screen()));
                                                      },
                                                      child: Icon(
                                                        Icons.favorite,
                                                        color: Color(
                                                            0xFFDB3022),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          listResponse[index]['title']
                                              .toString(),
                                          maxLines: 1,
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            overflow:
                                            TextOverflow.ellipsis,
                                          ),
                                        ),
                                        SizedBox(height: 20),
                                        Row(children: [
                                          Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                            size: 22,
                                          ),
                                          Text(
                                            '(' +
                                                listResponse[index]
                                                ['rating']
                                                    .toString() +
                                                ')',
                                          ),
                                          SizedBox(height: 10),
                                          Text(
                                            listResponse[index]["price"]
                                                .toString(),
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xFFDB3022),
                                            ),
                                          ),
                                        ]),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Icons.favorite,
/*color: Color(
                                                                0xFFDB3022),
                                                                  onPressed:
                                                                () {
                                                              dbHelper?.insert_fav(cartitems(
                                                                  //images: listResponse[index]
                                                                  //['images'],
                                                                  id: listResponse[index]['id'],
                                                                  title: listResponse[index]['title'],
                                                                  description: listResponse[index]['description'],
                                                                  price: listResponse[index]['price'],
                                                                  brand: listResponse[index]['brand'],
                                                                  category: listResponse[index]['category'],
                                                                  stock: listResponse[index]['stock'],
                                                                  thumbnail: listResponse[index]['thumbnail'],
                                                                  totalPrice: 2000));
                                                              Navigator.push(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                      builder: (context) =>
                                                                          Favorites_Screen()));
                                                                  },
                                                                  icon: Icon(
                                                              Icons.favorite,
                                                                  ),*/
