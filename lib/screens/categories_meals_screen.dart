import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/models/meals.dart';
import 'package:meal_app/widgets/meal_item.dart';

class CategoriesMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';

  final List<Meal> availableMeals;

  const CategoriesMealsScreen(this.availableMeals);

  @override
  _CategoriesMealsScreenState createState() => _CategoriesMealsScreenState();
}

class _CategoriesMealsScreenState extends State<CategoriesMealsScreen> {

  String categoryTitle;
  List<Meal> displayedMeal;

  //Quand on ne peut pas utiliser initState qui souvent est trés tot
  // (certains trucs sont pas encore crées)
  // on utiise didChangeDependencies
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    final routeArgs =
    ModalRoute.of(context).settings.arguments as Map<String, Object>;
    categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];

    // available.property permet de récupérer les données passés par deux
    // stateful
    displayedMeal = widget.availableMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
  }
  
  void _removeMeal(String mealId) {
    setState(() {
      displayedMeal.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {

    // routeArgs permet de récupérer les données fournit par
    // Navigator.of(context).pushNamed(CategoriesMealsScreen.routeName, arguments: {
    //       'id': id,
    //       'title': title
    //     });


    return Scaffold(
        appBar: AppBar(title: Text(categoryTitle)),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return MealItem(
                id: displayedMeal[index].id,
                title: displayedMeal[index].title,
                imageUrl: displayedMeal[index].imageUrl,
                duration: displayedMeal[index].duration,
                complexity: displayedMeal[index].complexity,
                affordability: displayedMeal[index].affordability,
                //removeItem: _removeMeal,
            );
          },
          itemCount: displayedMeal.length,
        )
    );
  }
}
