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
  bool _folded = true;
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
                    // Padding(
                    //   padding: const EdgeInsets.all(18.0),
                    //   child: TextField(
                    //     onSubmitted: (value) => {
                    //       Navigator.push(
                    //           context,
                    //           MaterialPageRoute(
                    //               builder: (context) => QueryNewsPage(
                    //                     queryname: value,
                    //                   )))
                    //     },
                    //     textAlign: TextAlign.center,
                    //     // onChanged: (text) => {
                    //     //   print(text),
                    //     // },
                    //     // controller: searchCtrl,
                    //     keyboardType: TextInputType.text,
                    //     decoration: InputDecoration(
                    //       hintText: 'Search',
                    //       hintStyle: TextStyle(fontSize: 16),
                    //       border: OutlineInputBorder(
                    //         borderRadius: BorderRadius.circular(8),
                    //         borderSide: BorderSide(
                    //           width: 0,
                    //           style: BorderStyle.none,
                    //         ),
                    //       ),
                    //       filled: true,
                    //       contentPadding: EdgeInsets.all(16),
                    //       // fillColor: colorSearchBg,
                    //     ),
                    //   ),
                    // ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 400),
                        width: _folded ? 56 : 300,
                        height: 56,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(32),
                          color: Colors.white,
                          boxShadow: kElevationToShadow[6],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.only(left: 10),
                                child: !_folded
                                    ? TextField(
                                        // onChanged: (value) => {print(value)},
                                        onSubmitted: (value) => {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      QueryNewsPage(
                                                        queryname: value,
                                                      )))
                                        },
                                        decoration: InputDecoration(
                                            hintText: "Search",
                                            hintStyle: TextStyle(
                                                color: Colors.blue[300]),
                                            border: InputBorder.none),
                                      )
                                    : null,
                              ),
                            ),
                            AnimatedContainer(
                              duration: Duration(milliseconds: 400),
                              child: Material(
                                type: MaterialType.transparency,
                                child: InkWell(
                                  borderRadius: BorderRadius.only(
                                      topLeft:
                                          Radius.circular(_folded ? 32 : 0),
                                      topRight: Radius.circular(32),
                                      bottomLeft:
                                          Radius.circular(_folded ? 32 : 0),
                                      bottomRight: Radius.circular(32)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Icon(
                                      _folded ? Icons.search : Icons.close,
                                      color: Colors.blue[900],
                                    ),
                                  ),
                                  onTap: () {
                                    setState(() {
                                      _folded = !_folded;
                                    });
                                  },
                                ),
                              ),
                            )
                          ],
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
