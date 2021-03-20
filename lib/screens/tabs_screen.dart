import 'package:flutter/material.dart';
import 'package:meal_app/screens/categories_screen.dart';

import 'favorites_screen.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Recettes'),
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.category), text: 'Catégories'),
              Tab(icon: Icon(Icons.star), text: 'Favoris'),
            ],
          ),
        ),
        body: TabBarView(children: [CategoriesScreen(), FavoritesScreen()]),
      ),
    );
  }
}
