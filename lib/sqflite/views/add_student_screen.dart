import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc_flutter/sqflite/bloc/student_bloc.dart';
import 'package:learn_bloc_flutter/sqflite/bloc/student_events.dart';
import 'package:learn_bloc_flutter/sqflite/models/students_model.dart';
import 'package:learn_bloc_flutter/sqflite/views/widgets/add_student_widgets.dart';

class AddStudentScreen extends StatelessWidget {
  AddStudentScreen({super.key});

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  var genders = ["Male", "Female", "Others"];
  bool isMarried = false;
  String selectedValue = "Male";
  final addStudentKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var view = AddStudentWidgets(context: context);
    return Scaffold(
      appBar: view.appBarView(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Form(
          key: addStudentKey,
          child: Column(
            children: [
              view.textFormField(nameController, hintText: "Enter full name"),
              const SizedBox(
                height: 5,
              ),
              view.textFormField(emailController,
                  hintText: "Enter email address"),
              const SizedBox(
                height: 5,
              ),
              view.textFormField(phoneController,
                  hintText: "Enter phone number",maxLength: 10,keyBoardType: TextInputType.number),
              const SizedBox(
                height: 5,
              ),
              StatefulBuilder(
                builder: (BuildContext context,
                    void Function(void Function()) setState) {
                  return view.genderDropDown(selected: selectedValue, genders,
                      onChanged: (String? value) {
                    selectedValue = value ?? "Male";
                    setState(() {});
                  });
                },
              ),
              const SizedBox(
                height: 5,
              ),
              StatefulBuilder(
                builder: (BuildContext context,
                    void Function(void Function()) setState) {
                  return view.maritalCheckBox(isMarried,
                      onChanged: (bool? value) {
                    isMarried = value ?? false;
                    setState(() {});
                  });
                },
              ),
              const SizedBox(
                height: 20,
              ),
              view.addButtonView(onPressed: () {
                var data = StudentsModel(
                    id: "".hashCode,
                    name: nameController.text,
                    email: emailController.text,
                    phone: phoneController.text,
                    gender: selectedValue,
                    isMarried: isMarried?1:0);
                if (addStudentKey.currentState!.validate()) {
                  context.read<StudentBloc>().add(AddStudentEvent(data));
                  Navigator.pop(context);
                }
              })
            ],
          ),
        ),
      ),
    );
  }
}
