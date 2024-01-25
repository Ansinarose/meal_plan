import 'package:hive_flutter/hive_flutter.dart';
import 'package:meal_plan/Hive_Database/RecipeModel.dart';

class Boxes{
  static Box<RecipeModel> getData() => Hive.box<RecipeModel>('items');
}