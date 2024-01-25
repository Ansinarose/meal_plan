
class EvaluationModel {
   String number, evaluationkey ;
   bool isSelected;

  EvaluationModel(this.number, this.evaluationkey, this.isSelected);
 }

class EvaluationResult {
  final int? id;
  final String statement;
  final String? score;
  final String date; // Change the type to String

  EvaluationResult({this.id, required this.statement, this.score, required this.date});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'statement': statement,
      'score': score,
      'date': date, // Save date as String
    };
  }

  factory EvaluationResult.fromMap(Map<String, dynamic> map) {
    return EvaluationResult(
      id: map['id'],
      statement: map['statement'],
      score: map['score'],
      date: map['date'],
    );
  }
}
