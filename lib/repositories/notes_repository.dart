import 'package:flutter/material.dart';
import 'package:notinha_do_role/models/note.dart';

class NotesRepository extends ChangeNotifier {
  final List<Note> _notes = [
    Note(
      description: 'Aniversário Vagner',
      date: DateTime.now(),
      amount: 320,
      peopleAmount: 4,
      type: 1,
    ),
    Note(
      description: 'Aniversário Lígia',
      date: DateTime.now(),
      amount: 467,
      peopleAmount: 8,
      type: 0,
    ),
    Note(
      description: 'Confra de natal',
      date: DateTime.now(),
      amount: 138,
      peopleAmount: 3,
      type: 2,
    ),
    Note(
      description: 'Virada do ano',
      date: DateTime.now(),
      amount: 200,
      peopleAmount: 5,
      type: 1,
    ),
    Note(
      description: 'Carnavrau',
      date: DateTime.now(),
      amount: 53,
      peopleAmount: 3,
      type: 3,
    ),
    Note(
      description: 'Viagem',
      date: DateTime.now(),
      amount: 200,
      peopleAmount: 6,
      type: 0,
    ),
    Note(
      description: 'Sunset bar',
      date: DateTime.now(),
      amount: 109,
      peopleAmount: 7,
      type: 2,
    ),
  ];

  List<Note> get notes => _notes;

  void addNote(Note note) {
    _notes.add(note);
    notifyListeners();
  }

  double calculateAmountForPerson(Note note) {
    final amountForPerson = double.parse(
      (note.amount / note.peopleAmount).toStringAsFixed(2),
    );

    return amountForPerson;
  }
}
