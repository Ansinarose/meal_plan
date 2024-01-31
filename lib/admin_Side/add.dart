import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meal_plan/admin_Side/home.dart';
import 'package:meal_plan/database_Connection/db_helper.dart';
import 'package:meal_plan/database_Connection/db_modelClass.dart';


class ScreenAdd extends StatefulWidget {
  const ScreenAdd({Key? key}) : super(key: key);
 @override
  State<ScreenAdd> createState() => _ScreenAddState();
                                       }
class _ScreenAddState extends State<ScreenAdd> {
  final _formKey = GlobalKey<FormState>();

  final DatabaseHelper databaseHelper = DatabaseHelper.instance;
List<String> Days = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];
  List<String> FoodTime = ['Breakfast', 'Lunch', 'Snack', 'Dinner'];

  String selectedDay = 'Monday';
  String selectedTime = 'Breakfast';
  final TextEditingController descriptionController = TextEditingController();
  File? _image;

  Future<void> _pickImage(ImageSource source) async {
  final pickedFile = await ImagePicker().pickImage(source: source);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }
  @override
  void initState(){
    super.initState();
   selectedTime = FoodTime.first;  
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 250, 226, 6),
                    ),
      body: SingleChildScrollView(
        
        child: Form(
          key: _formKey,
          child: Container(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                DropdownButtonFormField<String>(
                  value: selectedDay,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedDay = newValue!;
                    });
                  },
                  items: Days.map((String day) {
                    return DropdownMenuItem<String>(
                      value: day,
                      child: Text(day),
                    );
                     }).toList(),
                  decoration: InputDecoration(
                    labelText: 'Day',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.black),
                    ),), ),
                SizedBox(height: 20),
                 DropdownButtonFormField<String>(
                  value: selectedTime,
                  onChanged: (String? newvalue) {
                  setState(() {
                selectedTime = newvalue!;
                              });
                               },
              items: FoodTime.map((String foodtime) {
              return DropdownMenuItem<String>(
                value: foodtime,
                child: Text(foodtime),
              );
            }).toList(),
            decoration: InputDecoration(
              labelText: 'Food Time',
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.black),
              ),),),
               SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        backgroundColor: Color.fromARGB(255, 250, 226, 6),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        title: Row(
                          children: [
                            Column(
                              children: [
                                Text(
                                  'Camera',
                                  style: TextStyle(fontSize: 15),),
                                IconButton(
                                  onPressed: () {
                                    _pickImage(ImageSource.camera);
                                    Navigator.pop(context);
                                  },
                                  icon: Icon(Icons.camera_alt_outlined),)
                              ],),
                            SizedBox(width: 100),
                            Column(
                              children: [
                                Text(
                                  'Gallery',
                                  style: TextStyle(fontSize: 15),),
                                IconButton(
                                  onPressed: () {
                                    _pickImage(ImageSource.gallery);
                                    Navigator.pop(context);
                                  },
                                  icon: Icon(Icons.photo_outlined),
                                )],
                            ),
                          ],
                        ),
                      ));
                                 },
                  child: Container(
                    height: 250,
                    width: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: _image != null
                          ? DecorationImage(
                              image: FileImage(_image!),
                              fit: BoxFit.cover,
                            )
                          : DecorationImage(
                              image: AssetImage('images/plates.png'),
                            ),
                    ) ),),
                SizedBox(height: 20),
                TextField(
                  controller: descriptionController,
                  decoration: InputDecoration(
                    labelText: 'Description',
                    border: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(20),
                     borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                 
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 250, 226, 6)),
                  onPressed: () {
                   if (_formKey.currentState!.validate() &&
                          _image != null &&
                          selectedDay.isNotEmpty &&
                          selectedTime.isNotEmpty && descriptionController.text.isNotEmpty) {
                        _addToDatabase();
                        Navigator.pop(context);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Please fill in all the details',style: TextStyle(color: Colors.amber),),
                          ),
                        );
                      }
                   },
                  child: Text(
                    'Add Food', style: TextStyle(color: Colors.black), ),),
                              ],
                           ) ),
        ),
                       ),
                   );
                       }
  Future<void> _addToDatabase() async {
    final day = selectedDay;
    final foodtime = selectedTime;
    final image = _image != null ? _image!.path : '';
    final description = descriptionController.text;
    
    final meal = MealModel(
      day: day,
      foodtime: foodtime,
      image: image,
      description: description,
    );
    await databaseHelper.insertMeal(meal);
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ScreenAdHome()));
  }
}
