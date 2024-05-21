import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:university_students/controller/addscreen_provider.dart';
import 'package:university_students/controller/database_provider.dart';
import 'package:university_students/model/student_model.dart';
import 'package:university_students/view/home_screen/home_screen.dart';

Container submitbutton(BuildContext context) {
  final provider = Provider.of<AddScreenProvider>(context,listen: false);

  return Container(
    width: 180,
    height: 40,
    decoration: BoxDecoration(
      color: Colors.grey[800],
      borderRadius: BorderRadius.circular(12),
    ),
    child: TextButton(
      onPressed: () {
       submitData(context);
      provider.dayController.clear();
      provider.monthController.clear();
      provider.nameController.clear();
      provider.reviewController.clear();
      provider.universityController.clear();
      provider.yearController.clear();
      provider.selectedValue = null;
      },
      child: const Text(
        "Submit",
        style: TextStyle(color: Colors.white),
      ),
    ),
  );
}

Future submitData(BuildContext context) async {
  final provider = Provider.of<AddScreenProvider>(context,listen: false);
  final dbprovider = Provider.of<StudentDbProvider>(context,listen: false);

  final model = StudentModel(
    subject: provider.selectedValue!,
    day: provider.dayController.text,
    month: provider.monthController.text,
    year: provider.yearController.text,
    review: provider.reviewController.text,
    name: provider.nameController.text,
    university: provider.universityController.text,
    id: DateTime.now().microsecondsSinceEpoch.toString(),
  );

  await dbprovider.addStudent(model);

  // ignore: use_build_context_synchronously
  Navigator.of(context).pushReplacement(MaterialPageRoute(
    builder: (context) => const HomeScreen(),
  ));
  dbprovider.getAllStudents();
}
