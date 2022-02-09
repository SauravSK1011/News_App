import 'package:flutter/material.dart';
import 'package:news_app/helper/data.dart';
import 'package:news_app/helper/news.dart';
import 'package:news_app/modal/artical_modal.dart';
import 'package:news_app/modal/carogry_modal.dart';
import 'package:news_app/widget/blog_tile.dart';
import 'package:news_app/widget/card_tile.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> caterorys = [];
  List<ArticalModel> articalsnews = [];
  bool _loding = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    caterorys = getCategories();
    grtNews();
  }

  grtNews() async {
    News newsclass = News();
    await newsclass.getNews();
    articalsnews = newsclass.news;
    setState(() {
      _loding = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text("News", style: TextStyle(color: Colors.black)),
            Text(
              "App",
              style: TextStyle(color: Colors.blue),
            )
          ],
        ),
      ),
      body: _loding
          ? Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            )
          : SingleChildScrollView(
            child: Container( color: Colors.white70,
              child: Column(
                  children: [
                    Container(
                      height: 70,
                      child: ListView.builder(
                        itemCount: caterorys.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return CardTile(
                            imgurl: caterorys[index].imgurl,
                            name: caterorys[index].name,
                          );
                        },
                      ),
                    ),
                    Container(
                      child: ListView.builder(
                        itemCount: articalsnews.length,
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return BlogTile(
                            title: articalsnews[index].title,
                            img: articalsnews[index].urlToImage,
                            dec: articalsnews[index].description,
                            url: articalsnews[index].url,
                          );
                        },
                      ),
                    ),
                  ],
                ),
            ),
          ),
    );
  }
}
