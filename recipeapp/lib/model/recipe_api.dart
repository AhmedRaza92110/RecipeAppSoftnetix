import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:recipeapp/model/recipe.dart';

class RecipeApi {
  static Future<List<Recipe>> getRecipe() async {
    var uri = Uri.https('yummly2.p.rapidapi.com', '/feeds/list', {
      "limit": "18",
      "start": "0",
      "tag": "list.recipe.popular"
    });

    try {
      final response = await http.get(uri, headers: {
        "x-rapidapi-key": "e3a7b38bc4mshdf1f94d3dddaeeap16fd58jsn7630ccd35758",
        "x-rapidapi-host": "yummly2.p.rapidapi.com",
        "useQueryString": "true"
      });

      if (response.statusCode == 200) {
        Map data = jsonDecode(response.body);
        List _temp = [];

        for (var i in data['feed']) {
          _temp.add(i['content']['details']);
        }

        return Recipe.recipesFromSnapshot(_temp);
      } else {
        // Log the error status code
        print('Error: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      // Log any exception that occurs
      print('Exception: $e');
      return [];
    }
  }
}
