import 'package:flutter/material.dart';

class BasicTextInput extends StatelessWidget {
  final String? title;
  final TextEditingController editingController;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;

  const BasicTextInput({
    super.key,
    required this.title,
    required this.editingController,
    this.validator,
    this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Text(title ?? "")),
          TextFormField(
            controller: editingController,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
            ),
            onSaved: onSaved,
            validator: validator ??
                (String? value) {
                  if (value != null && value.contains('@')) {
                    return 'Do not use the @ character.';
                  }
                  return null;
                },
            keyboardType: TextInputType.text,
          ),
        ],
      ),
    );
  }
}
