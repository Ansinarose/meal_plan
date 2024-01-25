
//new concept
class MealModel {
  int? id; // Database ID, set by SQLite
 final String day;
 final String foodtime;
 final String image;
 final String description;

  MealModel({
    this.id,
   required  this.day,
   required   this.foodtime,
   required this.image,
   required this.description,
  });

  // Convert a FoodModel object to a Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'day': day,
      'foodtime': foodtime ,
      'image': image,
      'description': description,
    };
  }

  // Create a FoodModel object from a Map
  factory MealModel.fromMap(Map<String, dynamic> map) {
    return MealModel(
      id: map['id'],
      day: map['day'],
      foodtime: map['foodtime'],
      image: map['image'],
      description: map['description'],
    );
  }
}
//feedback completed
class FeedbackModel {
  final int? id;
  final String feedbackDate;
  final String notes;

  FeedbackModel({
    this.id,
    required this.feedbackDate,
    required this.notes,
  });

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'feedbackDate': feedbackDate,
      'notes': notes,
    };
  }

  factory FeedbackModel.fromMap(Map<String, dynamic> map) {
    return FeedbackModel(
      id: map['id'],
      feedbackDate: map['feedbackDate'],
      notes: map['notes'],
    );
  }
}
