import 'package:hive/hive.dart';
part 'student_model.g.dart';

@HiveType(typeId: 1)
class StudentModel extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  String subject;
  @HiveField(2)
  String day;
    @HiveField(3)
  String month;
    @HiveField(4)
  String year;
  @HiveField(5)
  String review;
  @HiveField(6)
  String university;
  @HiveField(7)
  String id;

  StudentModel(
      {required this.subject,
      required this.day,
      required this.month,
      required this.year,
      required this.review,
      required this.name,
      required this.university,
      required this.id,});
}
