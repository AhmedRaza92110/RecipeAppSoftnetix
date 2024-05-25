import 'package:flutter/material.dart';


import 'package:flutter/material.dart';
import 'package:recipeapp/model/recipe.dart';

class RecipeDetailPage extends StatelessWidget {
  final Recipe recipe;

  RecipeDetailPage({required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.network(recipe.images),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                recipe.name,
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Rating: ${recipe.rating}'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Total Time: ${recipe.totalTime}'),
            ),
            // Add more details here as needed
          ],
        ),
      ),
    );
  }
}
