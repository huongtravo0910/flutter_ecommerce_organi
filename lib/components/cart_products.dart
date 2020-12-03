import 'package:flutter/material.dart';

class Cart_products extends StatefulWidget {
  @override
  _Cart_productsState createState() => _Cart_productsState();
}

class _Cart_productsState extends State<Cart_products> {
  static const product_on_cart = [
    {
      "name": "Meat",
      "picture": "images/product/product-1.jpg",
      'price': 80,
      'quantity': 2,
      'origin': "Australia"
    },
    {
      "name": "Banana",
      "picture": "images/product/product-2.jpg",
      'price': 80,
      'quantity': 5,
      'origin': "NewZealand"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 2,
      itemBuilder: (context, index) {
        print(product_on_cart[index]['name']);
        return Single_cart_prod(
          single_prod__cart_name: product_on_cart[index]['name'],
          single_prod__cart_origin: product_on_cart[index]['origin'],
          single_prod__cart_picture: product_on_cart[index]['picture'],
          single_prod__cart_price: product_on_cart[index]['price'],
          single_prod__cart_qty: product_on_cart[index]['quantity'],
        );
      },
    );
  }
}

class Single_cart_prod extends StatelessWidget {
  final String single_prod__cart_name;
  final String single_prod__cart_picture;
  final int single_prod__cart_qty;
  final int single_prod__cart_price;
  final String single_prod__cart_origin;
  Single_cart_prod({
    this.single_prod__cart_name,
    this.single_prod__cart_picture,
    this.single_prod__cart_qty,
    this.single_prod__cart_price,
    this.single_prod__cart_origin,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.asset(single_prod__cart_picture),
        title: Text(single_prod__cart_name),
        subtitle: Column(children: [
          Row(children: [
            Padding(
              child: Text(
                'Origin',
                style: TextStyle(color: Colors.grey),
              ),
              padding: EdgeInsets.all(4.0),
            ),
            Padding(
              child: Text(
                '${single_prod__cart_origin}',
                style: TextStyle(color: Colors.green),
              ),
              padding: EdgeInsets.all(4.0),
            ),
          ]),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              '\$${single_prod__cart_price}',
              style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
          )
        ]),
      ),
    );
  }
}
