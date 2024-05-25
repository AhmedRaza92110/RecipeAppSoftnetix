import 'package:flutter/material.dart';
import 'package:recipeapp/model/recipe.dart';

import 'package:recipeapp/views/recipe_detailedpage.dart';

class RecipeCard extends StatelessWidget {
  final String title;
  final String cookTime;
  final String rating;
  final String thumbnailUrl;
  final Recipe recipe;

  RecipeCard({
    required this.title,
    required this.cookTime,
    required this.rating,
    required this.thumbnailUrl,
    required this.recipe,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RecipeDetailPage(recipe: recipe),
          ),
        );
      },
      child: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Column(
          children: <Widget>[
            Image.network(thumbnailUrl),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Cook Time: $cookTime'),
                  Text('Rating: $rating'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
