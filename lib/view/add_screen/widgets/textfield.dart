import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextFieldWidget extends StatelessWidget {
  String text;
  int lines;
  TextEditingController controller;
  TextFieldWidget({
    required this.text,
    required this.lines,
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.black,
      controller: controller,
      maxLines: lines,
      decoration: InputDecoration(
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        border: const OutlineInputBorder(),
        hintText: text,
        hintStyle: const TextStyle(color: Colors.black),
        fillColor: Colors.white,
        filled: true,
      ),
    );
  }
}
