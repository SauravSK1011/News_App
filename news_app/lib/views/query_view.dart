import 'package:flutter/material.dart';
import 'package:news_app/helper/news.dart';
import 'package:news_app/modal/artical_modal.dart';
import 'package:news_app/widget/blog_tile.dart';

class QueryNewsPage extends StatefulWidget {
  QueryNewsPage({Key? key, @required this.queryname}) : super(key: key);
  final queryname;

  @override
  State<QueryNewsPage> createState() => _QueryNewsPageState();
}

class _QueryNewsPageState extends State<QueryNewsPage> {
  List<ArticalModel> articalsnews = [];
  bool _loding = true;
  @override
  void initState() {
    super.initState();
    grtNews();
  }

  grtNews() async {
    Search newsclass = Search();
    await newsclass.getNews(widget.queryname.toString().toLowerCase());
    articalsnews = newsclass.search;
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
        actions: <Widget>[
          Opacity(
            opacity: 0,
            child: Container(
                child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Icon(Icons.save),
            )),
          ),
          Opacity(
            opacity: 0,
            child: Container(
                child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Icon(Icons.save),
            )),
          )
        ],
      ),
      body: _loding
          ? Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            )
          : SingleChildScrollView(
              child: Container(
                child: ListView.builder(
                  itemCount: articalsnews.length,
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  scrollDirection: Axis.vertical,
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
            ),
    );
  }
}
