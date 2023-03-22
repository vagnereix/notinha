import 'package:flutter/material.dart';
import 'package:notinha_do_role/models/note.dart';
import 'package:notinha_do_role/shared/utils.dart';

class CardWidget extends StatelessWidget {
  final bool isOdd;
  final Note note;

  const CardWidget({
    super.key,
    required this.isOdd,
    required this.note,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      padding: const EdgeInsets.symmetric(horizontal: 35),
      decoration: BoxDecoration(
        color: isOdd
            ? Theme.of(context).colorScheme.onSurface
            : Theme.of(context).colorScheme.tertiary,
        borderRadius: BorderRadius.circular(45),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            getCorrectIcon(note.type),
            color: Colors.grey[900],
            size: 35,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                note.description,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.grey[900],
                ),
              ),
              Text(
                convertDate(note.date),
                style: TextStyle(
                  color: Colors.grey[900],
                ),
              ),
            ],
          ),
          Text(
            'R\$ ${note.amount.toStringAsFixed(2)}',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.grey[900],
            ),
          ),
        ],
      ),
    );
  }
}
