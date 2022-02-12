import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:news_app/helper/news.dart';
import 'package:news_app/modal/artical_modal.dart';
import 'package:news_app/widget/blog_tile.dart';
import 'package:news_app/widget/searchbar.dart';

class CatgoryNewsPagewithurl extends StatefulWidget {
  const CatgoryNewsPagewithurl({Key? key, @required this.url1})
      : super(key: key);
  final url1;

  @override
  _CatgoryNewsPagewithurlState createState() => _CatgoryNewsPagewithurlState();
}

class _CatgoryNewsPagewithurlState extends State<CatgoryNewsPagewithurl> {
  List<ArticalModel> articalsnews = [];
  bool _loding = true;
  bool _folded = true;
  @override
  void initState() {
    super.initState();
    grtNews();
  }

  grtNews() async {
    String? apiKey = dotenv.env["API_KEY"];
    Withlink newsclass = Withlink();
    await newsclass.getNews(widget.url1);
    articalsnews = newsclass.withlink;
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
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
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
        actions: <Widget>[
          Opacity(
            opacity: 0,
            child: Container(
                child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Icon(Icons.save),
            )),
          ),
          Opacity(
            opacity: 0,
            child: Container(
                child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Icon(Icons.save),
            )),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
              child: SearchBar(),
            ),
            _loding
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
                          return BlogTile(
                            title: articalsnews[index].title,
                            img: articalsnews[index].urlToImage,
                            dec: articalsnews[index].description,
                            url: articalsnews[index].url,
                          );
                        },
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
