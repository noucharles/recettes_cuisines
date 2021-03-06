import 'package:flutter/material.dart';
import 'package:meal_app/screens/categories_meals_screen.dart';

class CategoryItem extends StatelessWidget {

  final String id;
  final String title;
  final Color color;

  const CategoryItem(this.id, this.title, this.color);

  void selectCategory(BuildContext context) {
    // .pop() c'est pour supprimer une page
    // .push() c'est pour ajouter une nouvelle page
    Navigator.of(context).pushNamed(CategoriesMealsScreen.routeName, arguments: {
      'id': id,
      'title': title
    });
  }

  @override
  Widget build(BuildContext context) {
    //Inkwell = Effet d'entrainement + GestureDetector permet d'ajouter des actions
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme
          .of(context)
          .primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(18),
        child: Text(title, style: Theme
            .of(context)
            .textTheme
            .title,),
        decoration: BoxDecoration(
          color: color,
          gradient: LinearGradient(
            colors: [color.withOpacity(0.7), color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
