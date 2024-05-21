import 'package:hive/hive.dart';
import 'package:university_students/controller/database_provider.dart';
import 'package:university_students/model/student_model.dart';

class DbServices{
   Future<List<StudentModel>> getAllStudents() async {
    final studentDB = await Hive.openBox<StudentModel>(studentDBName);
    return studentDB.values.toList();
  }

  Future<void> addStudents(StudentModel obj) async {
    final studentDB = await Hive.openBox<StudentModel>(studentDBName);
    await studentDB.put(obj.id, obj);
  }
}