
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapi/Screen/PopularScreen.dart';
import 'package:newsapi/main.dart';

import '../Screen/CategoryScreen.dart';

class SideNavBar extends StatelessWidget {
  const SideNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Colors.red
            ),
              accountName: Text('Udara San'),
              accountEmail: Text('udarassanjeewa@gmail.com'),
            currentAccountPicture:  CircleAvatar(
              child: ClipOval(
                child: Image.network(
                  height: 100,
                    width: 100,
                    fit: BoxFit.cover ,
                    'https://avatars0.githubusercontent.com/u/28812093?s=460&u=06471c90e03cfd8ce2855d217d157c93060da490&v=4'),
              ),
            )
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomePage())
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.category),
            title: Text('Category'),
            onTap: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CategoryScreen())
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.new_label),
            title: Text('Popular'),
            onTap: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PopularScreen())
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.search_rounded),
            title: Text('Serach'),
            onTap: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CategoryScreen())
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.filter),
            title: Text('Filter'),
            onTap: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CategoryScreen())
              );
            },
          ),
        ],
      ),
    );
  }
}
