import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meal_plan/Hive_Database/RecipeModel.dart';
import 'package:meal_plan/Hive_Database/addRecipe.dart';
import 'package:meal_plan/Hive_Database/box.dart';
import 'package:meal_plan/Hive_Database/editRecipe.dart';
import 'package:meal_plan/Hive_Database/recipeDetails.dart';

class ScreenRecipe extends StatefulWidget {
  const ScreenRecipe({Key? key}) : super(key: key);

  @override
  State<ScreenRecipe> createState() => _ScreenRecipeState();
}

class _ScreenRecipeState extends State<ScreenRecipe> {
   String? category;
  File? image;
  TextEditingController titleController = TextEditingController();
  TextEditingController preparationTimeController = TextEditingController();
  TextEditingController cookingTimeController = TextEditingController();
  TextEditingController ingredientsController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController nutritionController = TextEditingController();
  TextEditingController imageController = TextEditingController();

  late ValueNotifier<List<RecipeModel>> _savedRecipesNotifier;

  @override
  void initState() {
    super.initState();
    _savedRecipesNotifier = ValueNotifier<List<RecipeModel>>([]);
    _loadSavedRecipes();
  }

  @override
  void dispose() {
    _savedRecipesNotifier.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 250, 226, 6),
        title: Text('MY RECIPES',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => ScreenAddRecipe()),
              );
            },
            icon: Icon(Icons.add),
          )
        ],
      ),
      body: ValueListenableBuilder<Box<RecipeModel>>(
        valueListenable: Boxes.getData().listenable(),
        builder: (context, box, _) {var recipe=box.values.toList().cast<RecipeModel>();
          return recipe.isNotEmpty
              ? GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: box.length,
                  itemBuilder: (context, index) {
                    return _buildRecipeContainer(recipe[index]);
                  },
                )
              : Center(
                  child: Text('No Recipes'),
                );
        },
      ),
    );
  }

  Widget _buildRecipeContainer(RecipeModel recipe) {
    return GestureDetector(
      onTap: () {
        showRecipeDetails(recipe);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            image: recipe.image != null && recipe.image.isNotEmpty
                ? DecorationImage(
                    image: FileImage(File(recipe.image.toString())),
                    fit: BoxFit.cover,
                  )
                : null,
          ),
          child: Stack(
            children: [
              Positioned.fill(
                child: FractionallySizedBox(
                  heightFactor: 0.5,
                  alignment: Alignment.topCenter,
                  child: Container(),
                ),
              ),
              Positioned.fill(
                bottom: 0,
                child: FractionallySizedBox(
                  heightFactor: 0.25,
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    color: Colors.black.withOpacity(0.6),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Flexible(
                          child: Center(
                            child: Text(
                              recipe.title,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                           editRecipes(recipe,
                            recipe.title.toString(),
                            recipe.preparationTime.toString(),
                            recipe.cookingTime.toString(), recipe.category.toString(), recipe.ingredients.toString(),
                            recipe.description.toString(), recipe.nutrition.toString(), recipe.image.trim());
                          },
                          icon: Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            
                            deleteRecipe(recipe);
                          },
                          icon: Icon(
                            Icons.delete,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  void showRecipeDetails(RecipeModel recipe){
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ScreenRecipeDetails(recipe: recipe,)));
  }
  void deleteRecipe(RecipeModel itemModel) async {
    await itemModel.delete();
  }
  Future<void> editRecipes(
    RecipeModel UpdateModel,
    String title1,
    String preparationTime1,
    String cookingTime1,
    String ingredients1,
    String description1,
    String nutrition1,
    String image1,
    String category1,
                      ) async {
                        titleController.text = title1.toString();
                        preparationTimeController.text = preparationTime1.toString();
                        cookingTimeController.text = cookingTime1.toString();
                        ingredientsController.text = ingredients1.toString();
                        descriptionController.text = description1.toString();
                        nutritionController.text = nutrition1.toString();
                        imageController.text = image1;
                        category = category1.toString();
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ScreenEditRecipe(UpdateModel: UpdateModel,)));
                      }

  Future<void> _loadSavedRecipes() async {
    try {
      final box = await Hive.openBox<RecipeModel>('items');
      List<RecipeModel> recipes = box.values.toList();

      _savedRecipesNotifier.value = recipes;
    } catch (e) {
      print('Error loading saved recipes: $e');
    }
  }
}
