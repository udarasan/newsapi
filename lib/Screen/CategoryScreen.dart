// @dart=2.9

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../componets/SideNavBar.dart';
import '../componets/customListTile.dart';
import '../model/Article.dart';
import '../service/ApiService.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key key}) : super(key: key);


  @override
  State<CategoryScreen> createState() => _CategoryScreen();
}
class _CategoryScreen extends State<CategoryScreen>{
  String keyword='Business';
  static const List<String> entries = <String>[
    'Business',
    'Science',
    'Entertainment',
    'Sports',
    'Technology',
  ];

  @override
  Widget build(BuildContext context) {
    ApiService client = ApiService();

    return Scaffold(
      drawer: SideNavBar(),
      appBar: AppBar(
        title: const Text("Category", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.red,
      ),
      body: Container(
        child: Container(
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            SizedBox(
              height: 60,
              child: ListView.builder(
                itemCount: entries.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) => Container(
                  height: 150,
                  width: 150,
                  margin: EdgeInsets.all(10),
                  child: InkWell(
                    onTap: (){
                      setState((){
                        keyword=entries[index];
                        print('$keyword');
                      });

                    },
                    child: Text(
                      '${entries[index]}',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  color: Colors.red[200],
                ),
              ),
            ),
            Flexible(
              child: FutureBuilder(
                future: client.getDynamicArticle(keyword),
                builder: (BuildContext context,
                    AsyncSnapshot<List<Article>> snapshot) {
                  //let's check if we got a response or not
                  if (snapshot.hasData) {
                    //Now let's make a list of articles
                    List<Article> articles = snapshot.data;
                    return ListView.builder(
                      //Now let's create our custom List tile
                      itemCount: articles?.length,
                      itemBuilder: (context, index) =>
                          customListTile(articles[index], context),
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            )
          ]),
        ),
      ),
    );
  }


}
