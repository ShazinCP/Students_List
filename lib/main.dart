import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:university_students/controller/database_provider.dart';
import 'package:university_students/model/student_model.dart';
import 'package:university_students/controller/addscreen_provider.dart';
import 'package:university_students/view/home_screen/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  if (!Hive.isAdapterRegistered(StudentModelAdapter().typeId)) {
    Hive.registerAdapter(StudentModelAdapter());
  }

  await Hive.openBox<StudentModel>(studentDBName);

  runApp(const MyApp());

  runApp(const MyApp());
  StudentDbProvider().getAllStudents();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AddScreenProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => StudentDbProvider(),
        ),
      ],
      child: const MaterialApp(
        title: 'University Students',
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
