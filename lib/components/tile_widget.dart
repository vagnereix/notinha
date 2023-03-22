import 'package:flutter/material.dart';
import 'package:notinha_do_role/models/note.dart';

import '../shared/utils.dart';

class TileWidget extends StatelessWidget {
  final bool isOdd;
  final Note note;

  const TileWidget({
    Key? key,
    required this.isOdd,
    required this.note,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        gradient: !isOdd
            ? LinearGradient(
                colors: [
                  Colors.grey.shade800,
                  Colors.grey.shade600,
                ],
              )
            : null,
        borderRadius: BorderRadius.circular(22),
      ),
      child: ListTile(
        leading: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Icon(
            getCorrectIcon(note.type),
            color: Colors.white,
            size: 35,
          ),
        ),
        title: Text(
          note.description,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        subtitle: Text(
          convertDate(note.date),
          style: const TextStyle(
            color: Colors.grey,
          ),
        ),
        trailing: Text(
          'R\$ ${note.amount.toStringAsFixed(2)}',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
