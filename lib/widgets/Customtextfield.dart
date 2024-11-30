import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.iconData,
    required this.label,
    required this.hintText,
    this.controller,
    this.maxLines,
    this.onSaved,
  });
  final void Function(String?)? onSaved;
  final int? maxLines;
  final IconButton? iconData;
  final String label, hintText;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        onSaved: onSaved,
        validator: (value) {
          if (value?.isEmpty ?? true) {
            return 'Enter title';
          }
          return null;
        },
        controller: controller,
        maxLines: maxLines,
        decoration: InputDecoration(
          label: Text(label),
          suffixIcon: iconData,
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
