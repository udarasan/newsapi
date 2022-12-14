import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../componets/SideNavBar.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final List<String> entries = <String>['technology', 'business', 'C'];
    return Scaffold(
      drawer: SideNavBar(),
      appBar: AppBar(
        title: const Text("Category", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.red,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            SizedBox(
              height: 60,
              child: ListView.builder(
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Container(
                  height: 150,
                  width: 150,
                  margin: EdgeInsets.all(10),
                  child: Center(
                    child: Text(
                      "Card $index",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  color: Colors.green[700],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
