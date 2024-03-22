import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc_flutter/bloc/sqflite/bloc/student_events.dart';
import 'package:learn_bloc_flutter/bloc/sqflite/bloc/student_state.dart';
import 'package:learn_bloc_flutter/bloc/sqflite/models/students_model.dart';

class StudentBloc extends Bloc<StudentEvent, StudentState> {
  StudentBloc() : super(StudentInitState()) {
    on<AddStudentEvent>((event, emit) async {
      List<StudentsModel> students = [];
      await event.insertData(event.data).then((value) {
        students.add(event.data);
        students.addAll(state.students);
        emit(state.copyWith(students: students, state: state));
      });
    });

    on<UpdateStudentEvent>((event, emit) async {
      await event.updateData(event.data).then((value) {
        state.students[event.index] = event.data;
        emit(state.copyWith(students: state.students, state: state));
      });
    });

    on<RemoveStudentEvent>((event, emit) async {
      await event.removeData(event.id).then((value) {
        state.students.removeAt(event.index);
        emit(state.copyWith(state: state, students: state.students));
      });
    });

    on<GetStudentsEvent>((event, emit) async {
      await event.getData().then((data) {
        state.students = List.from(state.students)..addAll(data);
        emit(state.copyWith(students: state.students, state: state));
      });
    });
  }
}
