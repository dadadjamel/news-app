import 'package:flutter/material.dart';
import 'package:flutterNews/helper/news.dart';
import 'package:flutterNews/models/article_model.dart';
import 'package:flutterNews/views/home.dart';

class Category extends StatefulWidget {
  final String category;
  Category({this.category});
  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  List<ArticleModel> articles = new List<ArticleModel>();
  bool _loading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getnewsCat();
  }

  getnewsCat() async {
    NewsCat newsClass = NewsCat();
    await newsClass.getNewscategory(widget.category);
    articles = newsClass.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Flutter'),
            Text(
              'News',
              style: TextStyle(color: Colors.blue),
            )
          ],
        ),
        actions: [
          Opacity(
            opacity: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(Icons.save),
            ),
          )
        ],
      ),
      body: _loading
          ? Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            )
          : SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemCount: articles.length,
                  // scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return (BlogTile(
                      imageURL: articles[index].urltoimage,
                      title: articles[index].title,
                      desc: articles[index].description,
                      url: articles[index].url,
                    ));
                  },
                ),
              ),
            ),
    );
  }
}
