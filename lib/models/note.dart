import 'dart:convert';

class Note {
  final double amount;
  final int peopleAmount;
  final int type;
  final String description;
  final DateTime date;

  Note({
    required this.amount,
    required this.peopleAmount,
    required this.type,
    required this.description,
    required this.date,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'amount': amount,
      'peopleAmount': peopleAmount,
      'type': type,
      'description': description,
      'date': date.millisecondsSinceEpoch,
    };
  }

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      amount: map['amount'] as double,
      peopleAmount: map['peopleAmount'] as int,
      type: map['type'] as int,
      description: map['description'] as String,
      date: DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory Note.fromJson(String source) =>
      Note.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Note(amount: $amount, peopleAmount: $peopleAmount, type: $type, description: $description, date: $date)';
  }
}
