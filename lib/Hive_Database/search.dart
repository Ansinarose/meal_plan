import 'package:flutter/material.dart';
import 'package:meal_plan/Hive_Database/RecipeModel.dart';
import 'package:meal_plan/Hive_Database/recipeDetails.dart';

class ScreenSearch extends StatefulWidget {
  final List<RecipeModel> allRecipes;

  ScreenSearch({required this.allRecipes});

  @override
  _ScreenSearchState createState() => _ScreenSearchState();
}

class _ScreenSearchState extends State<ScreenSearch> {
  TextEditingController _searchController = TextEditingController();
  List<RecipeModel> _searchResults = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 250, 226, 6),
        title: Text('Search Recipes'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              onChanged: (value) {
                _performSearch(value);
              },
              decoration: InputDecoration(
                hintText: 'Enter recipe name',
              ),
            ),
          ),
          Expanded(
            child: _buildSearchResults(),
          ),
        ],
      ),
    );
  }

  void _performSearch(String query) {
    setState(() {
      _searchResults = widget.allRecipes
          .where((recipe) =>
              recipe.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  Widget _buildSearchResults() {
    if (_searchController.text.isEmpty) {
      return Center(
        child: Text('Enter recipe name for search'),
      );
    }

    if (_searchResults.isEmpty) {
      return Center(
        child: Text('No matching recipes found'),
      );
    }

    return ListView.builder(
      itemCount: _searchResults.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(_searchResults[index].title),
          onTap: () {
            showRecipeDetails(_searchResults[index]);
          },
        );
      },
    );
  }

  void showRecipeDetails(RecipeModel recipe) {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> ScreenRecipeDetails(recipe: recipe)));
  }

}
