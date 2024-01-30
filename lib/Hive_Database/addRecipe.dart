import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meal_plan/Hive_Database/RecipeModel.dart';
import 'package:meal_plan/Hive_Database/recipe.dart';
class ScreenAddRecipe extends StatefulWidget {
  const ScreenAddRecipe({super.key});
 @override
  State<ScreenAddRecipe> createState() => _ScreenAddRecipeState();
}
class _ScreenAddRecipeState extends State<ScreenAddRecipe> {
  final _formKey = GlobalKey<FormState>();
  String? category;
  File? image;
  TextEditingController titleController = TextEditingController();
  TextEditingController preparationTimeController = TextEditingController();
  TextEditingController cookingTimeController = TextEditingController();
  TextEditingController ingredientsController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController nutritionController = TextEditingController();
  TextEditingController imageController = TextEditingController();

  Future<void> _pickImage(ImageSource source) async {
  final pickedFile = await ImagePicker().pickImage(source: source);
     setState(() {
      if (pickedFile != null) {
        image = File(pickedFile.path);
        imageController.text = pickedFile.path;
      }
    });
  }
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 250, 226, 6),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 40.0, top: 20),
                child: Text('You can add your recipe here',
                style: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.bold),),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: titleController,
                  decoration: InputDecoration(
                      labelText: 'Title',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5))),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: preparationTimeController,
                        decoration: InputDecoration(
                            labelText: 'Preparation Time',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5)))),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: cookingTimeController,
                        decoration: InputDecoration(
                            labelText: 'Cooking Time',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5))),
                      ),
                    ),),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonFormField<String>(
                  value: category,
                  onChanged: (String? newValue) {
                    setState(() {
                      category = newValue!;
                    });
                  },
                  items: <String>['all', 'vegetarian']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  decoration: InputDecoration(
                      labelText: 'Categories',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(maxLines: 3,
                  controller: ingredientsController,
                  decoration: InputDecoration(
                    labelText: 'Ingredients',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
                ),
              ),
               Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  maxLines: 2,
                  controller: descriptionController,
                  decoration: InputDecoration(
                    labelText: 'Description',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)) ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: nutritionController,
                  decoration: InputDecoration(
                    labelText: 'Nutrition',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
                ),
              ),
              SizedBox(height: 10,),
              Container(
                height: 180,
                width: 380,
                color: Color.fromARGB(255, 223, 222, 220),
                child: Center(
                   child: image != null
                ? Stack(
                    children: [
                      Image.file(
                        image!,
                        height: 180,
                        width: 380,
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        top: 8,
                        right: 8,
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              image = null;
                              imageController.text = '';
                            });
                          },
                          icon: Icon(Icons.cancel, color: Colors.black),
                        ),
                      ),
                    ],
                  )
                  : IconButton(onPressed: (){
                      showDialog(context: context, 
                  builder: (context)=> AlertDialog(
                    backgroundColor: Color.fromARGB(255, 250, 226, 6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                    ),
                    title: Row(
                      children: [Column(
                        children: [
                          Text('Camera',
                          style: TextStyle(fontSize: 15),),
                          IconButton(onPressed: () {
                             _pickImage(ImageSource.camera);
                             Navigator.pop(context);
                          }, icon: Icon(Icons.camera_alt_outlined)),
                        ], ),
                       SizedBox(width: 100),
                            Column(
                              children: [
                                Text(
                                  'Gallery',
                                  style: TextStyle(fontSize: 15),),
                                  IconButton(onPressed: (){
                                    _pickImage(ImageSource.gallery);
                                    Navigator.pop(context);
                                  }, icon: Icon(Icons.photo_outlined))
                      ])
                      ],),
                    ));
                  }, icon: Icon(Icons.camera_alt,size: 50,)),
                ),
               ),
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: ElevatedButton(onPressed: () async{
                  if (_formKey.currentState!.validate() && imageController.text.isNotEmpty&&preparationTimeController.text.isNotEmpty&&
                  cookingTimeController.text.isNotEmpty&& descriptionController.text.isNotEmpty&& nutritionController.text.isNotEmpty ) {
                    await  _saveRecipeToDatabase();
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ScreenRecipe()));
                  }else{
                    ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Please fill in all the details',style: TextStyle(color: Colors.amber),),
                          ),
                        );
                  }
                 },
                  style: ElevatedButton.styleFrom(
                  backgroundColor:Color.fromARGB(255, 250, 226, 6) ,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('ADD',
                                 style: TextStyle(color: Colors.black),),
                  )), )
            ],),),
      ),
    );
  } _saveRecipeToDatabase() async {
   var recipe = RecipeModel(
      title: titleController.text.toString(),
      preparationTime: preparationTimeController.text.toString(),
      cookingTime: cookingTimeController.text.toString(),
      category: category.toString(),
      ingredients: ingredientsController.text.toString(),
      description: descriptionController.text.toString(),
      nutrition: nutritionController.text.toString(),
      image: imageController.text.toString(),);
    var  box = await Hive.openBox<RecipeModel>('items');
    await box.add(recipe);
    Navigator.of(context).pop();
  }
  }
  
