import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/widgets/meal_item.dart';

class CategoriesMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';

  // final String categoryId;
  // final String categoryTitle;
  // const CategoriesMealsScreen(this.categoryId, this.categoryTitle);

  @override
  Widget build(BuildContext context) {

    // routeArgs ppermet de récupérer les données fournit par
    // Navigator.of(context).pushNamed(CategoriesMealsScreen.routeName, arguments: {
    //       'id': id,
    //       'title': title
    //     });
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];

    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
        appBar: AppBar(title: Text(categoryTitle)),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return MealItem(
                id: categoryMeals[index].id,
                title: categoryMeals[index].title,
                imageUrl: categoryMeals[index].imageUrl,
                duration: categoryMeals[index].duration,
                complexity: categoryMeals[index].complexity,
                affordability: categoryMeals[index].affordability);
          },
          itemCount: categoryMeals.length,
        ));
  }
}
