// import 'dart:html';

import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/views/artical_view.dart';

class BlogTileHomeScreen extends StatelessWidget {
  const BlogTileHomeScreen(
      {Key? key,
      @required this.title,
      @required this.dec,
      @required this.img,
      @required this.url})
      : super(key: key);
  final title;
  final img;
  final dec;
  final url;

  @override
  Widget build(BuildContext context) {
    var width1 = MediaQuery.of(context).size.width * 0.80;
    var height1 = MediaQuery.of(context).size.height * 0.25;
    Color textcolor = Colors.black;

    return GestureDetector(
      onTap: () => {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ArticalView(Blogurl: url)))
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          color: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
          elevation: 5,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: height1,
                  width: width1,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(img, fit: BoxFit.cover)),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(bottom: 4, right: 8, left: 8, top: 4),
                child: Center(
                  child: Container(
                    width: width1,
                    child: Text(
                      title.toString().substring(0, 60) + "...",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: textcolor,
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.only(
              //       bottom: 10, right: 10, left: 10, top: 4),
              //   child: Align(
              //       alignment: Alignment.center,
              //       child: Container(width: width1, child: Text(dec))),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

class BlogTile extends StatelessWidget {
  const BlogTile(
      {Key? key,
      @required this.title,
      @required this.dec,
      @required this.img,
      @required this.url})
      : super(key: key);
  final title;
  final img;
  final dec;
  final url;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ArticalView(Blogurl: url)))
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
          elevation: 25,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(img, fit: BoxFit.cover)),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(bottom: 4, right: 8, left: 8, top: 4),
                child: Center(
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    bottom: 10, right: 10, left: 10, top: 4),
                child: Align(alignment: Alignment.center, child: Text(dec)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
