import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:university_students/controller/addscreen_provider.dart';
import 'package:university_students/view/add_screen/widgets/dateofbirthfield.dart';
import 'package:university_students/view/add_screen/widgets/dropdownbutton.dart';
import 'package:university_students/view/add_screen/widgets/submitbutton.dart';
import 'package:university_students/view/add_screen/widgets/textfield.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "AddScreen",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Consumer<AddScreenProvider>(
            builder: (context, provider, child) {
              return Column(
                children: [
                  const SizedBox(height: 20),
                  TextFieldWidget(
                    text: 'Name',
                    lines: 1,
                    controller: provider.nameController,
                  ),
                  const SizedBox(height: 10),
                  bropdownbutton(),
                  const SizedBox(height: 10),
                  TextFieldWidget(
                    text: 'University',
                    lines: 1,
                    controller: provider.universityController,
                  ),
                  const SizedBox(height: 10),
                  dateofbirthfield(context),
                  const SizedBox(height: 12),
                  TextFieldWidget(
                    text: 'Review...',
                    lines: 3,
                    controller: provider.reviewController,
                  ),
                  const SizedBox(height: 25),
                  submitbutton(context),
                  const SizedBox(height: 25),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
