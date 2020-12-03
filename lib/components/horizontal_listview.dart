import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Category(
            image_location: 'images/categories/cat-1.jpg',
            image_caption: 'cat-1',
          ),
          Category(
            image_location: 'images/categories/cat-2.jpg',
            image_caption: 'cat-2',
          ),
          Category(
            image_location: 'images/categories/cat-3.jpg',
            image_caption: 'cat-3',
          ),
          Category(
            image_location: 'images/categories/cat-4.jpg',
            image_caption: 'cat-4',
          ),
          Category(
            image_location: 'images/categories/cat-5.jpg',
            image_caption: 'cat-5',
          ),
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String image_location;
  final String image_caption;

  Category({this.image_location, this.image_caption});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.2),
      child: InkWell(
        onTap: () {},
        child: Container(
          width: 80.0,
          child: ListTile(
            title: Image.asset(
              image_location,
              width: 80.0,
              height: 40.0,
            ),
            subtitle: Container(
              alignment: Alignment.topCenter,
              child: Text(image_caption),
            ),
          ),
        ),
      ),
    );
  }
}
