import 'package:flutter/material.dart';
import 'package:meal_app/screens/categories_screen.dart';

import 'screens/categories_meals_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recettes de cuisine',
      theme: ThemeData(
        // primarySwatch : est une couleur principale de l'application, par
        // exemple, elle change la couleur de la barre d'applications
        //
        // accentColor : ou la couleur secondaire est La couleur de premier plan
        // pour les widgets, par exemple floatingActionButton
        //
        // canvasColor : et cela peut changer la couleur du widget d'échafaudage
        //pink, amber
        primarySwatch: Colors.teal,
        accentColor: Colors.purple,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
          body1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
          body2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
          title: TextStyle(
            fontSize: 20,
            fontFamily: 'RobotoCondensed',
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      // home: CategoriesScreen(),
      initialRoute: '/',
      //MyHomePage(title: 'Flutter Demo Home Page'),
      routes: {
        '/': (context) => CategoriesScreen(),
        CategoriesMealsScreen.routeName : (context) => CategoriesMealsScreen(),
      },
    );
  }
}
