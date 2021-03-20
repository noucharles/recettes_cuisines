import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:meal_app/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  Widget buildSectionTitle(String text, BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }

  Widget buildContainer(Widget child, BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10)),
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        height: (MediaQuery.of(context).size.height -
                MediaQuery.of(context).padding.top) *
            0.3,
        width: 300,
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final mealId = routeArgs['id'];
    final selectMeal = DUMMY_MEALS.firstWhere((meal) => mealId == meal.id);

    return Scaffold(
        appBar: AppBar(title: Text("${selectMeal.title}")),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 300,
                width: double.infinity,
                child: Image.network(
                  selectMeal.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              buildSectionTitle('Ingrédients', context),
              buildContainer(
                  ListView.builder(
                    itemCount: selectMeal.ingredients.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        color: Theme.of(context).accentColor,
                        child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            child: Text(selectMeal.ingredients[index])),
                      );
                    },
                  ),
                  context),
              buildSectionTitle('Etapes', context),
              buildContainer(
                  ListView.builder(
                      itemCount: selectMeal.steps.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(children: [
                          ListTile(
                            leading: CircleAvatar(
                              child: Text('#${index + 1}'),
                            ),
                            title: Text(selectMeal.steps[index]),
                          ),
                          Divider(),
                        ]);
                      }),
                  context)
            ],
          ),
        ));
  }
}
