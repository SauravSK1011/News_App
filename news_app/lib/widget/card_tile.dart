import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/views/catgory_news.dart';

class CardTile extends StatelessWidget {
  final imgurl;
  final name;
  const CardTile({Key? key, @required this.imgurl, @required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (Context) => CatgoryNewsPage(catgoryname: name)));
      },
      child: Container(
        margin: EdgeInsets.only(right: 5,left: 5),
        child: Stack(children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: CachedNetworkImage(
              imageUrl: imgurl,
              width: 120,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),
          Container(
              width: 120,
              height: 60,
              decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(6)),
              child: Center(
                  child: Text(
                name,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              )))
        ]),
      ),
    );
  }
}
