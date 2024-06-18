import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:meals_app/models/meal.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, required this.title, required this.meals});

  final String title;
  final List<Meal> meals;

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
              itemBuilder: (context, index) {
                return Text(meals[index].title,
                style: TextStyle(color: Colors.white),
                );
              },
            )
            : Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Oh no......nothing here")
              ],
            ),
      ),
    );
  }
}
