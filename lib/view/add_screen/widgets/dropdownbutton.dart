import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:university_students/controller/addscreen_provider.dart';

Container bropdownbutton() {
  return Container(
    width: 320,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      border: Border.all(
        width: 2,
        color: Colors.black,
      ),
    ),
    child: Consumer<AddScreenProvider>(
      builder: (context, provider, child) {
        return 
       DropdownButtonFormField(
        value: provider.selectedValue,
        onChanged: (value) {
          // setState(() {
          //   selectedValue = value;
          // });
          provider.selectedValue = value;
        },
        items: provider.items.map((e) {
          return DropdownMenuItem(
            value: e,
            child: Row(
              children: [
                Text(
                  e,
                  style: const TextStyle(fontSize: 17),
                )
              ],
            ),
          );
        }).toList(),
        hint: const Text(
          'Subjects',
          style: TextStyle(color: Colors.black),
        ),
        dropdownColor: Colors.white,
        isExpanded: true,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.transparent, width: 0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.transparent, width: 0),
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        ),
      );
      },
    ),
  );
}
