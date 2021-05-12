import 'package:flutter/material.dart';

class EditingDialog<T> extends StatefulWidget {
  final String fieldName;
  final T initialValue;

  EditingDialog({Key? key, required this.fieldName, required this.initialValue})
      : super(key: key);

  @override
  _EditingDialogState<T> createState() => _EditingDialogState<T>(initialValue);
}

class _EditingDialogState<T> extends State<EditingDialog<T>> {
  late TextEditingController _textController;

  _EditingDialogState(T initialValue) {
    _textController = new TextEditingController(text: "$initialValue");
  }

  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Editando ${widget.fieldName}"),
      content: TextField(
        controller: _textController,
        decoration: InputDecoration(
          labelText: widget.fieldName,
        ),
        style: TextStyle(
          fontSize: 16,
        ),
        keyboardType: _onlyNumbers() ? TextInputType.number : null,
      ),
      actions: [
        TextButton(
          child: const Text("Cancelar"),
          onPressed: () => Navigator.pop(context),
        ),
        TextButton(
          child: const Text("Confirmar"),
          onPressed: () {
            final value = _textController.text;
            if (T == String) Navigator.pop(context, value);

            if (_onlyNumbers()) {
              final asInt = int.tryParse(value);
              if (asInt != null) {
                Navigator.pop(context, asInt);
              }
            }
          },
        ),
      ],
    );
  }

  bool _onlyNumbers() {
    return (T == int) || (T is int?);
  }
}
