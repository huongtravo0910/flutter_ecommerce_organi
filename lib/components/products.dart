import 'package:flutter/material.dart';
import 'package:flutter_drawer/pages/product_details.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  static const product_list = [
    {
      "name": "Meat",
      "picture": "images/product/product-1.jpg",
      'old_price': 90,
      'price': 80,
    },
    {
      "name": "Banana",
      "picture": "images/product/product-2.jpg",
      'old_price': 90,
      'price': 80,
    },
    {
      "name": "Guava",
      "picture": "images/product/product-3.jpg",
      'old_price': 90,
      'price': 80,
    },
    {
      "name": "Grape",
      "picture": "images/product/product-4.jpg",
      'old_price': 90,
      'price': 80,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400.0,
      child: GridView.builder(
        itemCount: product_list.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Single_prod(
            prod_name: product_list[index]['name'],
            prod_picture: product_list[index]['picture'],
            prod_old_price: product_list[index]['old_price'],
            prod_price: product_list[index]['price'],
          );
        },
      ),
    );
  }
}

class Single_prod extends StatelessWidget {
  final String prod_name;
  final String prod_picture;
  final int prod_old_price;
  final int prod_price;
  Single_prod(
      {this.prod_name,
      this.prod_picture,
      this.prod_old_price,
      this.prod_price});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
        tag: prod_name,
        child: Material(
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ProductDetails(
                        product_detail_name: prod_name,
                        product_detail_old_price: prod_old_price,
                        product_detail_picture: prod_picture,
                        product_detail_price: prod_price,
                      )));
            },
            child: GridTile(
              footer: Container(
                  height: 30,
                  color: Colors.white70,
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          prod_name,
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        "\$${prod_price}",
                        style: TextStyle(
                            color: Colors.green, fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
              child: Image.asset(
                prod_picture,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
