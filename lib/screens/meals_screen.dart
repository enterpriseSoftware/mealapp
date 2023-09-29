import 'package:flutter/material.dart';
import 'package:meal_app/model/meal.dart';
import 'package:meal_app/widgets/meal_item.dart';
import 'package:meal_app/widgets/no_meals.dart';
import 'package:meal_app/screens/meal_details_screen.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, required this.meals, required this.onToggleFavorite, this.title});


  final String? title;
  final List<Meal> meals;
  final void Function(Meal) onToggleFavorite;

  void selectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (ctx) => MetalDetailsScreen(meal: meal, onToggleFavorite: onToggleFavorite)));
  }

  @override
  Widget build(BuildContext context) {
    final Widget content;
    if (meals.isEmpty) {
      content = const NoMeals();
    } else {
      content = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (ctx, index) => MealItem(
          meal: meals[index],
          onSelectedMeal: (Meal meal) {
            selectMeal(context, meal);
          },
        ),
      );
    }

    if (title == null) {
      return content;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: content,
    );
  }
}
