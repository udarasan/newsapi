import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/Article.dart';

class ArticleScreen extends StatelessWidget {
final Article article;

ArticleScreen({required this.article});

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text(article.title),
      backgroundColor: Colors.red,
    ),
    body: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200.0,
            width: double.infinity,
            decoration: BoxDecoration(
              //let's add the height

              image: DecorationImage(
                  image: NetworkImage(article.urlToImage), fit: BoxFit.cover),
            ),
          ),
          SizedBox(
            height: 12.0,
          ),
          Container(
            padding: EdgeInsets.all(6.0),
            decoration: BoxDecoration(
              color: Colors.red,
            ),
            child: Text(
              article.source.name,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          Text(
            article.description,
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 20.0,
            ),
          )
        ],
      ),
    ),
  );
}
}