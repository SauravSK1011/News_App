import 'package:flutter/material.dart';
import 'package:news_app/helper/data.dart';
import 'package:news_app/helper/news.dart';
import 'package:news_app/modal/artical_modal.dart';
import 'package:news_app/modal/carogry_modal.dart';
import 'package:news_app/views/query_view.dart';
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
              child: Container(
                color: Colors.white70,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: TextField(
                        onSubmitted: (value) => {Navigator.push(context,
            MaterialPageRoute(builder: (context) => QueryNewsPage(queryname: value,)))},
                        textAlign: TextAlign.center,
                        // onChanged: (text) => {
                        //   print(text),
                        // },
                        // controller: searchCtrl,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: 'Search',
                          hintStyle: TextStyle(fontSize: 16),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                          ),
                          filled: true,
                          contentPadding: EdgeInsets.all(16),
                          // fillColor: colorSearchBg,
                        ),
                      ),
                    ),
                    // IconButton(
                    //   onPressed: () {},
                    //   icon: Icon(Icons.search),
                    // ),
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
