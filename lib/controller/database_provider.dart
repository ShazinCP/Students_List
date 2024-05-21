import 'package:flutter/material.dart';
import 'package:university_students/model/student_model.dart';
import 'package:university_students/services/db_services.dart';

const studentDBName = 'Student_database';

class StudentDbProvider extends ChangeNotifier {
  List<StudentModel> studentList = [];

  final DbServices _studentService = DbServices();

  Future<void> getAllStudents() async {
    studentList = await _studentService.getAllStudents();
    notifyListeners();
  }

  Future<void> addStudent(StudentModel data) async {
    await _studentService.addStudents(data);
    await getAllStudents();
  }
}
