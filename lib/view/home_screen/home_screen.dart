import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:university_students/controller/database_provider.dart';
import 'package:university_students/view/add_screen/add_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<StudentDbProvider>(context, listen: false);
    provider.getAllStudents();
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "HomeScreen",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Consumer<StudentDbProvider>(
        builder: (context, provider, child) {
          return ListView.builder(
            itemCount: provider.studentList.length,
            itemBuilder: (context, index) {
              final student = provider.studentList[index];
              return Card(
                color: const Color.fromARGB(228, 250, 250, 250),
                child: ListTile(
                  title: Text(
                    student.name,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  subtitle: Text(
                    student.university,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const AddScreen(),
        )),
        child: const Icon(
          Icons.add,
          size: 26,
        ),
      ),
    );
  }
}
