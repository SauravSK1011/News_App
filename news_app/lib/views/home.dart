import 'package:flutter/material.dart';
import 'package:news_app/helper/data.dart';
import 'package:news_app/helper/news.dart';
import 'package:news_app/modal/artical_modal.dart';
import 'package:news_app/modal/carogry_modal.dart';
import 'package:news_app/views/catgory_news._withurl.dart';
import 'package:news_app/views/query_view.dart';
import 'package:news_app/widget/blog_tile.dart';
import 'package:news_app/widget/card_tile.dart';
import 'package:news_app/widget/searchbar.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> caterorys = [];
  List<ArticalModel> articalsnews = [];
  List<ArticalModel> articalsnews123 = [];

  bool _loding = true;
  bool _folded = true;
  String urlforwroldnews =
      "https://newsapi.org/v1/articles?source=the-verge&apiKey=";
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
    Withlink newsclass1 = Withlink();
    await newsclass1.getNews(urlforwroldnews);
    articalsnews123 = newsclass1.withlink;

    setState(() {
      _loding = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Row(
                  children: const [
                    Text("News", style: TextStyle(color: Colors.black)),
                    Text(
                      "App",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 10.0, left: 25),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Discover",
                    style: TextStyle(fontSize: 55, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 10.0, left: 30),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "News from all over the wrold",
                    style: TextStyle(fontSize: 15, color: Colors.grey),
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
              const SearchBar(),
              _loding
                  ? Center(
                      child: Container(
                        child: const CircularProgressIndicator(),
                      ),
                    )
                  : SingleChildScrollView(
                      child: Container(
                        color: Colors.white,
                        child: Column(
                          children: [
                            Container(
                              color: Colors.transparent,
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
                            const SizedBox(
                              height: 25,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "News From india",
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    )),
                                // ElevatedButton(
                                //   style: ElevatedButton.styleFrom(
                                //     shape: new RoundedRectangleBorder(
                                //       borderRadius:
                                //           new BorderRadius.circular(30.0),
                                //     ),
                                //   ),
                                //   onPressed: () {},
                                //   child: Text(
                                //     "View More",
                                //     style: TextStyle(fontSize: 10),
                                //   ),
                                // )
                                InkWell(
                                  child: const Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      "View More",
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (Context) =>
                                                const CatgoryNewsPagewithurl(
                                                  url1:
                                                      "https://newsapi.org/v2/top-headlines?country=in&apiKey=",
                                                )));
                                  },
                                ),
                              ],
                            ),
                            Container(
                              height: 300,
                              color: Colors.transparent,
                              child: ListView.builder(
                                itemCount: (articalsnews.length / 4).toInt(),
                                shrinkWrap: true,
                                physics: const ClampingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return BlogTileHomeScreen(
                                    title: articalsnews[index].title,
                                    img: articalsnews[index].urlToImage,
                                    dec: articalsnews[index].description,
                                    url: articalsnews[index].url,
                                  );
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            // Text("News in india"),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "News From Wrold",
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    )),
                                InkWell(
                                  child: const Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      "View More",
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (Context) =>
                                                const CatgoryNewsPagewithurl(
                                                  url1:
                                                      "https://newsapi.org/v1/articles?source=the-verge&apiKey=",
                                                )));
                                  },
                                ),
                              ],
                            ),
                            Container(
                              height: 300,
                              color: Colors.transparent,
                              child: ListView.builder(
                                itemCount: (articalsnews123.length / 4).toInt(),
                                shrinkWrap: true,
                                physics: const ClampingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return BlogTileHomeScreen(
                                    title: articalsnews123[index].title,
                                    img: articalsnews123[index].urlToImage,
                                    dec: articalsnews123[index].description,
                                    url: articalsnews123[index].url,
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
