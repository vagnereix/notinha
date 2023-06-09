import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:notinha_do_role/models/note.dart';
import 'package:notinha_do_role/repositories/notes_repository.dart';
import 'package:provider/provider.dart';

import '../components/text_form_field_widget.dart';

class AddNotePage extends StatefulWidget {
  const AddNotePage({
    super.key,
  });
  @override
  State<AddNotePage> createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  final _noteAmountController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _peopleAmountController = TextEditingController();
  int? _typeNote;

  final _formKey = GlobalKey<FormState>();

  final _formatter = NumberFormat.simpleCurrency(
    locale: 'pt_BR',
    decimalDigits: 2,
  );

  late final NotesRepository _notesRepository;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _notesRepository = Provider.of<NotesRepository>(context, listen: false);
    });
  }

  ScaffoldFeatureController<MaterialBanner, MaterialBannerClosedReason>?
      _scaffoldMessengerController;

  void _createAndSaveNote() {
    final newNote = Note(
      amount: _formatter.parse(_noteAmountController.text) as double,
      peopleAmount: int.parse(_peopleAmountController.text),
      type: _typeNote as int,
      description: _descriptionController.value.text,
      date: DateTime.now(),
    );

    final amountForPerson = _notesRepository.calculateAmountForPerson(newNote);
    _notesRepository.addNote(newNote);

    ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
    _scaffoldMessengerController =
        ScaffoldMessenger.of(context).showMaterialBanner(
      MaterialBanner(
        content: RichText(
          text: TextSpan(
            text: 'Fica ',
            children: [
              TextSpan(
                text: 'R\$ $amountForPerson ',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.surfaceTint,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const TextSpan(
                text:
                    'para cada pagante. A nota estará disponível na sua lista de notas.',
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
            },
            child: const Text('Ver nota'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _noteAmountController.dispose();
    _descriptionController.dispose();
    _peopleAmountController.dispose();
    _scaffoldMessengerController?.close();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Registrar nova nota',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormFieldWidget(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, preencha este campo';
                    }

                    return null;
                  },
                  controller: _descriptionController,
                  label: 'Como você descreveria este rolê?',
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormFieldWidget(
                  isCurrency: true,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, preencha este campo';
                    }

                    if (_formatter.parse(value) as double == 0) {
                      return 'Este valor não pode ser zero';
                    }

                    return null;
                  },
                  controller: _noteAmountController,
                  label: 'Qual o valor total da nota?',
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormFieldWidget(
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, preencha este campo';
                    }

                    if (int.tryParse(value) == null) {
                      return 'O valor informado é inválido';
                    }

                    if (int.tryParse(value) == 0) {
                      return 'Este valor não pode ser zero';
                    }

                    return null;
                  },
                  controller: _peopleAmountController,
                  label: 'Qual o total de pessoas pagantes?',
                ),
                const SizedBox(
                  height: 16,
                ),
                DropdownButtonFormField(
                  validator: (value) {
                    if (value == null || value.isNaN) {
                      return 'Campo obrigatório';
                    }

                    return null;
                  },
                  items: const [
                    DropdownMenuItem(
                      value: 0,
                      child: Text('Barzinho'),
                    ),
                    DropdownMenuItem(
                      value: 1,
                      child: Text('Lanchonete'),
                    ),
                    DropdownMenuItem(
                      value: 2,
                      child: Text('Festa'),
                    ),
                    DropdownMenuItem(
                      value: 3,
                      child: Text('Cotinha'),
                    ),
                  ],
                  onChanged: (value) => _typeNote = value as int,
                  decoration: const InputDecoration(
                    isDense: true,
                    label: Text('Selecione o tipo desta nota'),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 25,
                          vertical: 15,
                        ),
                      ),
                      onPressed: () {
                        final isFormValid =
                            _formKey.currentState?.validate() ?? false;

                        if (isFormValid) {
                          _createAndSaveNote();
                        }
                      },
                      child: const Text(
                        'Gerar nota',
                        style: TextStyle(fontSize: 16),
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
}
