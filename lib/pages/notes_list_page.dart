import 'package:flutter/material.dart';
import 'package:notinha_do_role/components/tile_widget.dart';
import 'package:notinha_do_role/repositories/notes_repository.dart';
import 'package:provider/provider.dart';

import '../components/card_widget.dart';

class NotesListPage extends StatefulWidget {
  const NotesListPage({
    super.key,
  });

  @override
  State<NotesListPage> createState() => _NotesListPageState();
}

class _NotesListPageState extends State<NotesListPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<NotesRepository>(
      builder: (context, value, child) => Column(
        children: [
          Expanded(
            flex: 4,
            child: ListView.separated(
              itemCount: 3,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(25),
              itemBuilder: (context, index) {
                final lastNotes = value.notes.reversed.take(3).toList();
                debugPrint('Notes na página: ${value.notes}');

                if (index.isOdd) {
                  return CardWidget(
                    isOdd: true,
                    note: lastNotes[index],
                  );
                }

                return CardWidget(
                  isOdd: false,
                  note: lastNotes[index],
                );
              },
              separatorBuilder: (context, index) => const SizedBox(
                width: 10,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              itemCount: value.notes.length - 3,
              itemBuilder: (context, index) {
                final lastNotes = value.notes.reversed.skip(3).toList();

                if (index.isOdd) {
                  return TileWidget(
                    isOdd: true,
                    note: lastNotes[index],
                  );
                }

                return TileWidget(
                  isOdd: false,
                  note: lastNotes[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
