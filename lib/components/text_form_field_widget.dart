import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatefulWidget {
  const TextFormFieldWidget({
    Key? key,
    this.validator,
    this.keyboardType,
    this.isCurrency = false,
    required this.label,
    required this.controller,
  }) : super(key: key);

  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final String label;
  final bool isCurrency;

  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        isDense: true,
        border: const OutlineInputBorder(),
        label: Text(widget.label),
      ),
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      onEditingComplete: () => FocusScope.of(context).nextFocus(),
      inputFormatters: widget.isCurrency
          ? [
              CurrencyTextInputFormatter(
                locale: 'pt_BR',
                decimalDigits: 2,
                symbol: 'R\$',
                enableNegative: false,
              ),
            ]
          : [],
    );
  }
}
