import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc_flutter/bloc/sqflite/bloc/student_bloc.dart';
import 'package:learn_bloc_flutter/bloc/sqflite/bloc/student_events.dart';
import 'package:learn_bloc_flutter/bloc/sqflite/bloc/student_state.dart';
import 'package:learn_bloc_flutter/bloc/sqflite/views/widgets/students_widgets.dart';

class StudentsScreen extends StatefulWidget {
  const StudentsScreen({super.key});

  @override
  State<StudentsScreen> createState() => _StudentsScreenState();
}

class _StudentsScreenState extends State<StudentsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<StudentBloc>().add(GetStudentsEvent());
  }
  @override
  Widget build(BuildContext context) {
    var view = StudentsWidgets(context: context);
    return Scaffold(
      appBar: view.appBarView(),
      body: BlocBuilder<StudentBloc,StudentState>(builder: (BuildContext context, state) {
        var data = state.students;
        return data.isNotEmpty?ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
            itemBuilder: (_, index) {
              return view.studentsItemView(data[index],index);
            },
            separatorBuilder: (_, __) {
              return const SizedBox(height: 1,);
            },
            itemCount: data.length):const Center(child: Text("Add new student"),);
      },),
    );
  }
}
