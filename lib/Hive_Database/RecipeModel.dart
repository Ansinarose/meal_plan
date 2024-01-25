import 'package:hive/hive.dart';

part 'RecipeModel.g.dart';

@HiveType(typeId: 0)
class RecipeModel extends HiveObject{
  @HiveField(0)
   String title;

  @HiveField(1)
   String preparationTime;

  @HiveField(2)
   String cookingTime;

  @HiveField(3)
 String category;

  @HiveField(4)
   String ingredients;

  @HiveField(5)
   String description;

  @HiveField(6)
   String nutrition;

 @HiveField(7)
   String image;

  RecipeModel({
    required this.title,
    required this.preparationTime,
    required this.cookingTime,
    required this.category,
    required this.ingredients,
    required this.description,
    required this.nutrition,
    required this.image,
  });


}
