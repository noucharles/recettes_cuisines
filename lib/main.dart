import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/models/meals.dart';
import 'package:meal_app/screens/categories_screen.dart';
import 'package:meal_app/screens/favorites_screen.dart';
import 'package:meal_app/screens/filter_screen.dart';
import 'package:meal_app/screens/meal_detail_screen.dart';
import 'package:meal_app/screens/tabs_screen.dart';

import 'screens/categories_meals_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if(_filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if(_filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if(_filters['vegan'] && !meal.isVegan) {
          return false;
        }
        if(_filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealId) {
    final existingIndex = _favoriteMeals.indexWhere((meal) => meal.id == mealId);

    setState(() {
      if (existingIndex >= 0) {
        setState(() {
          _favoriteMeals.removeAt(existingIndex);
        });
      } else {
        setState(() {
          _favoriteMeals
              .add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
        });
      }
    });
  }

  bool _isFavorite(String mealId) {
    return _favoriteMeals.any((meal) => meal.id == mealId);
  }

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
        accentColor: Colors.yellow,
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
        '/': (context) => TabsScreen(_favoriteMeals),
        CategoriesMealsScreen.routeName : (context) => CategoriesMealsScreen(_availableMeals),
        MealDetailScreen.routeName : (context) => MealDetailScreen(_toggleFavorite, _isFavorite),
        FilterScreen.routeName: (context) => FilterScreen(_filters, _setFilters),
      },
      //onGenerateRoute: (settings) {
      //  print(settings.arguments);
      //  return MaterialPageRoute(builder: (context) => CategoriesMealsScreen());
      // },
      // Si on ne trouve pas la route
       onUnknownRoute: (settings) {
         return MaterialPageRoute(builder: (context) => CategoriesScreen());
       },
    );
  }
}
