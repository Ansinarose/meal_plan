import 'package:flutter/material.dart';
import 'package:meal_plan/Hive_Database/RecipeModel.dart';
import 'package:meal_plan/User_interaction/splash.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';


 const SAVE_KEY_NAME = 'UserLoggedIn';
 main() async {
  // await Hive.initFlutter();
  WidgetsFlutterBinding.ensureInitialized(); 
  var directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);


  Hive.registerAdapter(RecipeModelAdapter());
   await Hive.openBox<RecipeModel>('items');
  
  // //newly added 2 lines

  // await DatabaseHelper.instance.database; 
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meal Planner',
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: ScreenSplash()
    );
  }
}

