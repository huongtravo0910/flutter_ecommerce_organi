import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

import 'package:flutter_drawer/components/horizontal_listview.dart';
import 'package:flutter_drawer/components/products.dart';
import 'package:flutter_drawer/pages/cart.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Widget image_carousel = Container(
      height: 100.0,
      child: Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('images/blog/blog-2.jpg'),
          AssetImage('images/blog/blog-1.jpg'),
          AssetImage('images/blog/blog-3.jpg'),
          AssetImage('images/blog/blog-4.jpg'),
          AssetImage('images/blog/blog-5.jpg'),
        ],
        autoplay: false,
        // animationCurve: Curves.fastOutSlowIn,
        // animationDuration: Duration(milliseconds: 1000),
        dotSize: 4.0,
        indicatorBgPadding: 10.0,
        dotBgColor: Colors.transparent,
      ),
    );
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.green,
        title: Text("Ogani Shop"),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Cart()));
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            //header
            UserAccountsDrawerHeader(
              accountName: Text("Huong Tra"),
              accountEmail: Text("huongtravo0910@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.grey,
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              ),
              decoration: BoxDecoration(color: Colors.green),
            ),
            InkWell(
              child: ListTile(
                title: Text("Home Page"),
                leading: Icon(
                  Icons.home,
                  color: Colors.green,
                ),
              ),
            ),
            InkWell(
              child: ListTile(
                title: Text("My account"),
                leading: Icon(
                  Icons.person,
                  color: Colors.green,
                ),
              ),
            ),
            InkWell(
              child: ListTile(
                title: Text("My orders"),
                leading: Icon(
                  Icons.shopping_bag,
                  color: Colors.green,
                ),
              ),
            ),
            InkWell(
              child: ListTile(
                title: Text("Shopping cart"),
                leading: Icon(
                  Icons.shopping_cart,
                  color: Colors.green,
                ),
              ),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Cart()));
              },
            ),
            Divider(),
            InkWell(
              child: ListTile(
                title: Text("Setting"),
                leading: Icon(
                  Icons.settings,
                  color: Colors.grey,
                ),
              ),
            ),
            InkWell(
              child: ListTile(
                title: Text("About"),
                leading: Icon(
                  Icons.help,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
      body: new Column(
        children: [
          // image_carousel,
          Padding(
            padding: EdgeInsets.all(5.0),
            child: Text(
              'Categories',
              style: TextStyle(fontSize: 12),
            ),
          ),
          HorizontalList(),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              'Recent products',
              style: TextStyle(fontSize: 12),
            ),
          ),
          Flexible(child: Products()),
        ],
      ),
    );
  }
}