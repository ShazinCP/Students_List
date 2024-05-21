import 'package:flutter/material.dart';

class AddScreenProvider extends ChangeNotifier{
    String? selectedValue;
  TextEditingController nameController = TextEditingController();
  TextEditingController reviewController = TextEditingController();
  TextEditingController universityController = TextEditingController();



  final TextEditingController dayController = TextEditingController();
  final TextEditingController monthController = TextEditingController();
  final TextEditingController yearController = TextEditingController();

  List<String> items = ['English', 'Biology', 'Maths'];

   void setSelectedValue(String value) {
    selectedValue = value;
    notifyListeners();
  }
}