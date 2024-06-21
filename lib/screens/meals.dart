import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meal_details.dart';
import 'package:meals_app/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, required this.title, required this.meals,required this.onToggleFavorite});

  final String title;
  final List<Meal> meals;
  final void Function(Meal meal) onToggleFavorite;

  void selectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => MealDetails(meal: meal,onToggleFavorite:onToggleFavorite,),
    ));
  }

  @override
  Widget build(BuildContext context) {
    print(meals.length);
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: meals.isNotEmpty
            ? ListView.builder(
                itemCount: meals.length,
                itemBuilder: (context, index) => MealItem(
                  meal: meals[index],
                  onSelectMeal: ((meal) => selectMeal(context, meals[index])),
                ),
              )
            : Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Oh no......nothing here!",
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge!
                        .copyWith(color: ThemeData().colorScheme.background),
                  )
                ],
              ),
      ),
    );
  }
}
