import 'package:flutter/material.dart';
import 'package:meal_plan/User_interaction/about.dart';
import 'package:meal_plan/User_interaction/skip.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _screenhomeState();
}

class _screenhomeState extends State<ScreenHome> {
  final nameTextController = TextEditingController();
  final ageTextController = TextEditingController();
  final weightTextController = TextEditingController();
  final heightTextController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 250, 226, 6),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/about.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  keyboardType: TextInputType.name,
                  controller: nameTextController,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    prefixIcon: Icon(Icons.person_2),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.number,
                  controller: ageTextController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your age';
                    }
                    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                      return 'Please enter a valid age (numeric only)';
                    }
                    int age = int.parse(value);
                    if (age <= 0 || age >= 100) {
                      return 'Please enter a valid age between 1 and 99';
                    }
                    return null; // Validation passed
                  },
                  decoration: InputDecoration(
                    labelText: 'Age',
                    prefixIcon: Icon(Icons.numbers),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.number,
                  controller: heightTextController,
                  validator: (value) {
                    if(value == null || value.isEmpty){
                      return 'Please enter your height';
                    }
                    
                  },
                  decoration: InputDecoration(
                    labelText: 'Height',
                    prefixIcon: Icon(Icons.height),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.number,
                  controller: weightTextController,
                  validator: (value) {
                    if(value == null || value.isEmpty){
                      return 'Please enter your weight';
                    }
                  },
                  decoration: InputDecoration(
                    labelText: 'Weight',
                    prefixIcon: Icon(Icons.monitor_weight),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 25.0),
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (ctx) => Screen_about()),
                          );
                        },
                        child: Text(
                          'About',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    SizedBox(width: 100,),
                    TextButton(
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          // Form is valid, proceed with saving data
                          savedata();
                        }
                      },
                      child: const Text(
                        'Save Details',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> savedata() async {
    FocusScope.of(context).unfocus();

    if (nameTextController.text.isEmpty ||
        ageTextController.text.isEmpty ||
        heightTextController.text.isEmpty ||
        weightTextController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please enter all the details'),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', nameTextController.text);
    await prefs.setString('age', ageTextController.text);
    await prefs.setString('height', heightTextController.text);
    await prefs.setString('weight', weightTextController.text);

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (ctx) => ScreenSkip()),
    );
  }
}
