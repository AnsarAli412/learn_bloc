import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc_flutter/sqflite/bloc/student_events.dart';
import 'package:learn_bloc_flutter/sqflite/views/widgets/add_student_widgets.dart';

import '../bloc/student_bloc.dart';
import '../models/students_model.dart';

class UpdateStudentScreen extends StatelessWidget {
  final StudentsModel data;
  final int index;
  UpdateStudentScreen({super.key, required this.data, required this.index});

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  final genders = ["Male", "Female", "Others"];
  String selectedValue = "Male";
  bool isMarried = false;

  var updateStudentKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
     nameController = TextEditingController(text: data.name);
     emailController = TextEditingController(text: data.email);
     phoneController = TextEditingController(text: data.phone);
     selectedValue = data.gender;
     isMarried = data.isMarried == 1?true:false;
    var view = AddStudentWidgets(context: context);
    return Scaffold(
      appBar: view.appBarView(title: "Update Student"),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 10),
        child: Form(
          key: updateStudentKey,
          child: Column(
            // padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            children: [
              view.textFormField(nameController, hintText: "Enter full name"),
              const SizedBox(
                height: 5,
              ),
              view.textFormField(emailController, hintText: "Enter email address"),
              const SizedBox(
                height: 5,
              ),
              view.textFormField(phoneController, hintText: "Enter phone number"),
              const SizedBox(
                height: 5,
              ),
              StatefulBuilder(
                builder: (BuildContext context,
                    void Function(void Function()) setState) {
                  return view.genderDropDown(selected: selectedValue,genders, onChanged: (String? value) {
                    selectedValue = value ?? "Male";
                    setState((){});
                  });
                },
              ),
              const SizedBox(
                height: 5,
              ),
              StatefulBuilder(
                builder: (BuildContext context,
                    void Function(void Function()) setState) {
                  return view.maritalCheckBox(isMarried, onChanged: (bool? value) {
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
                if (updateStudentKey.currentState!.validate()) {
                  context.read<StudentBloc>().add(UpdateStudentEvent(data,index));
                  Navigator.pop(context);
                }
              }, title: "Update")
            ],
          ),
        ),
      ),
    );
  }
}
