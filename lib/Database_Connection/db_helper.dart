import 'package:meal_plan/evaluation/evaluationModel.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:meal_plan/database_Connection/db_modelClass.dart';

class DatabaseHelper {
  static const _databaseName = 'food_items.db';
  static const _databaseVersion = 1;

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(path, version: _databaseVersion, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
   await db.execute('''
      CREATE TABLE meals ( 
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        day TEXT,
        foodtime TEXT,
        image TEXT,
        description TEXT
                )
            ''' );
     await db.execute('''
      CREATE TABLE feedback (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        feedbackDate TEXT,
        notes TEXT
      )
    ''');
     await db.execute('''
          CREATE TABLE evaluation_result (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            statement TEXT,
            score TEXT,
            date TEXT
            
          )
          ''');
  }
  //new concept code
  Future<void> insertMeal(MealModel meal) async {
  final db = await database;
  var result = await db.insert(
    'meals',
    meal.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
  print('Inserted meal with ID: $result');
}


  Future<List<MealModel>> getAllMeals() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('meals');
    return List.generate(maps.length, (i) {
      return MealModel.fromMap(maps[i]);
    });
  }
  Future<MealModel?> getMealForDayAndTime(String day, String foodTime) async {
    Database db = await database;
    List<Map<String, dynamic>> maps = await db.query(
      'meals',
      where: 'day = ? AND foodtime = ?',
      whereArgs: [day, foodTime],
      limit: 1,
    );

    if (maps.isNotEmpty) {
      return MealModel(
        id: maps[0]['id'],
        day: maps[0]['day'],
        foodtime: maps[0]['foodtime'],
        image: maps[0]['image'],
        description: maps[0]['description'],
      );
    } else {
      return null;
    }
  }
  Future<int> updateMeal(MealModel updatedMeal) async {
  final db = await database;

  return await db.update(
    'meals',
    updatedMeal.toMap(),
    where: 'id = ?',
    whereArgs: [updatedMeal.id],
  );
}


  Future<int> deleteMeal(int? mealId) async {
  final db = await database;
  return await db.delete('meals', where: 'id = ?', whereArgs: [mealId]);
}


  // code for feedback            // completed
  Future<int> insertFeedback(String feedbackDate, List<String> notes) async {
    Database db = await database;
    return await db.insert(
      'feedback',
      {'feedbackDate': feedbackDate, 'notes': notes.join(', ')},
    );
  }
  Future<List<FeedbackModel>> getAllFeedback() async {
  Database db = await database;
  List<Map<String, dynamic>> maps = await db.query('feedback');
  return List.generate(maps.length, (i) {
    return FeedbackModel(
      id: maps[i]['id'],
      feedbackDate: maps[i]['feedbackDate'],
      notes: maps[i]['notes'],
    );
  });
}
Future<int> deleteFeedback(int feedbackId) async {
  Database db = await database;
  return await db.delete('feedback', where: 'id = ?', whereArgs: [feedbackId]);
}

//code for evaluation  //completed

Future<int> insertEvaluationResult(String statement, String score, String date) async {
  Database db = await instance.database;
  return await db.insert('evaluation_result', 
  {'statement': statement, 'score': score, 'date': date});
}
 Future<List<EvaluationResult>> getAllEvaluationResults() async {
    Database db = await instance.database;
    List<Map<String, dynamic>> maps = await db.query('evaluation_result');
    return List.generate(maps.length, (i) {
      return EvaluationResult(
        id: maps[i]['id'],
        statement: maps[i]['statement'],
        score: maps[i]['score'],
        date: maps[i]['date'],
      );
    });
  }
}










