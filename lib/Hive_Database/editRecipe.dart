

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meal_plan/Hive_Database/RecipeModel.dart';
import 'package:meal_plan/Hive_Database/recipe.dart';

class ScreenEditRecipe extends StatefulWidget {
  //const ScreenEditRecipe({super.key});
  final RecipeModel UpdateModel;

  const ScreenEditRecipe({super.key, required this.UpdateModel});


  @override
  State<ScreenEditRecipe> createState() => _ScreenEditRecipeState();
}

class _ScreenEditRecipeState extends State<ScreenEditRecipe> {
  // String? dropdownValue ;
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
  void initState() {
    titleController.text = widget.UpdateModel.title;
    preparationTimeController.text = widget.UpdateModel.preparationTime;
    cookingTimeController.text = widget.UpdateModel.cookingTime;
    ingredientsController.text = widget.UpdateModel.ingredients;
    descriptionController.text = widget.UpdateModel.description;
    nutritionController.text = widget.UpdateModel.nutrition;
    category =widget.UpdateModel.category;
    if (widget.UpdateModel.image != null && widget.UpdateModel.image.isNotEmpty) {
    image = File(widget.UpdateModel.image);
    imageController.text = widget.UpdateModel.image;
  }
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 250, 226, 6),
      ),
       body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 40.0, top: 20),
              child: Text('You can edit your recipe here',
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
                              borderRadius: BorderRadius.circular(5))),
                    ),
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
                  ),
                ),
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
              child: TextFormField(
                controller: ingredientsController,
                decoration: InputDecoration(
                  labelText: 'Ingredients',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))
                ),
              ),
            ),
             Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: descriptionController,
                decoration: InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: nutritionController,
                decoration: InputDecoration(
                  labelText: 'Nutrition',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))
                ),
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
               padding:  EdgeInsets.all(8.0),
               child: ElevatedButton(onPressed: () async{
               widget.UpdateModel.title = titleController.text.toString();
               widget.UpdateModel.preparationTime = preparationTimeController.text.toString();
               widget.UpdateModel.cookingTime = cookingTimeController.text.toString();
               widget.UpdateModel.category = category.toString();
               widget.UpdateModel.ingredients = ingredientsController.text.toString();
               widget.UpdateModel.description = descriptionController.text.toString();
               widget.UpdateModel.nutrition = nutritionController.text.toString();
               widget.UpdateModel.image = imageController.text.toString();
               
               await widget.UpdateModel.save();
               Navigator.pop(context);
;               
           
               },
                style: ElevatedButton.styleFrom(
                backgroundColor:Color.fromARGB(255, 250, 226, 6) ,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero, // Adjust the radius as needed
                  ),
                ),
                
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Edit',
                               style: TextStyle(color: Colors.black),),
                )),
             )
          ],
        ),
      ),
    );
    
  }
 
}