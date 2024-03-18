class Products {
  List<Product> products;
  int total;
  int skip;
  int limit;

  Products({
    required this.products,
    required this.total,
    required this.skip,
    required this.limit,
  });

  factory Products.fromMap(Map<String, dynamic> e) => Products(
    products: List<Product>.from(e["products"].map((x) => Product.fromMap(e))),
    total: e["total"],
    skip: e["skip"],
    limit: e["limit"],
  );

/*Map<String, dynamic> toJson() => {
    "products": List<dynamic>.from(products.map((x) => x.toJson())),
    "total": total,
    "skip": skip,
    "limit": limit,
  };*/
}

class Product {
  int id;
  String title;
  String? description;
  int price;
  double? discountPercentage;
  double? rating;
  int stock;

  //int pid;
  String brand;
  String category;
  String thumbnail;

  // List<String>? images;
  List<String>? images;
  int? initialPrice;
  late final int? quantity;

  Product({
    required this.id,
    required this.title,
    //required this.description,
    this.description,
    required this.price,
    this.discountPercentage,
    //required this.rating,
    this.rating,
    // required this.pid,
    required this.stock,
    required this.brand,
    required this.category,
    required this.thumbnail,
    this.images,
    this.initialPrice,
    this.quantity,
  });

  factory Product.fromMap(Map<String, dynamic> e) =>
      Product(
          id: e["id"],
          title: e["title"],
          description: e["description"],
          price: e["price"],
          discountPercentage: e["discountPercentage"]?.toDouble(),
          rating: e["rating"]?.toDouble(),
          stock: e["stock"],
          brand: e["brand"],
          category: e["category"],
          thumbnail: e["thumbnail"],
          initialPrice: e["initialPrice"],
          quantity: e["quantity"],
          // pid:e["pid"],
          images: List<String>.from(e["images"].map((e) => e))
      );

}
class cartitems {
  String title, brand, description, thumbnail, category;
  int stock, price;
  int? initialPrice,totalPrice;
  int id;
  late final int? quantity;

  //List<String>? images;
  cartitems({required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.brand,
    required this.category,
    required this.stock,
    //required this.images,
    required this.thumbnail,
    this.initialPrice,
    this.quantity,
    this.totalPrice
    /*required images*/
  });

  factory cartitems.fromMap(Map<String, dynamic> e) =>
      cartitems(
        id: e["id"],
        title: e["title"],
        description: e["description"],
        price: e["price"],
        // pid:e["pid"],
        //discountPercentage: e["discountPercentage"]?.toDouble(),
        //rating: e["rating"]?.toDouble(),
        initialPrice: e["initialPrice"],
        quantity: e["quantity"],
        stock: e["stock"],
        brand: e["brand"],
        category: e["category"],
        thumbnail: e["thumbnail"],
        totalPrice: e["totalPrice"]
        //images: e["images"],
        //images: List<String>.from(e["images"].map((e) => e)),
      );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'price': price,
      'brand': brand,
      'category': category,
      'stock': stock,
      'thumbnail': thumbnail,
      'initialPrice': initialPrice,
      'quantity': quantity,
      'totalPrice' : totalPrice
      //'pid':pid
      //'images':images
    };

  }

}