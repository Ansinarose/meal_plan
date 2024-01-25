import 'dart:io';
import 'package:flutter/material.dart';
import 'package:meal_plan/Database_Connection/db_modelClass.dart';
import 'package:meal_plan/Hive_Database/RecipeModel.dart';

class ScreenRecipeDetails extends StatefulWidget {
  final RecipeModel recipe;
  const ScreenRecipeDetails({Key? key, required this.recipe}): super(key: key);

  @override
  State<ScreenRecipeDetails> createState() => _ScreenRecipeDetailsState();
}

class _ScreenRecipeDetailsState extends State<ScreenRecipeDetails> {
  final TextStyle _textStyle = TextStyle(fontSize: 16,fontWeight: FontWeight.bold);
  final EdgeInsets _padding = EdgeInsets.all(20);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details of my recipe',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
        backgroundColor: Color.fromARGB(255, 250, 226, 6),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildText('Recipe: ${widget.recipe.title}', _textStyle),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Center(
                child: Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: FileImage(File(widget.recipe.image))),
                  ),
                ),
              ),
            ),
            _buildText('Preparation Time: ${widget.recipe.preparationTime}', _textStyle),
            _buildText('Cooking Time: ${widget.recipe.cookingTime}', _textStyle),
            _buildText('Category: ${widget.recipe.category}', _textStyle),
            _buildText('Ingredients: ${widget.recipe.ingredients}', _textStyle),
            _buildText('Description: ${widget.recipe.description}', _textStyle),
            _buildText('Nutrition: ${widget.recipe.nutrition}', _textStyle),
          ],
        ),
      ),
    );
  }
  Widget _buildText(String text, TextStyle style) {
    return Padding(
      padding: _padding,
      child: Text(text, style: style),
    );
  }
}
