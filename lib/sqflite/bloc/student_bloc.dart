import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc_flutter/sqflite/bloc/student_events.dart';
import 'package:learn_bloc_flutter/sqflite/bloc/student_state.dart';
import 'package:learn_bloc_flutter/sqflite/models/students_model.dart';

class StudentBloc extends Bloc<StudentEvent,StudentState> {
  StudentBloc() : super(StudentInitState()){
    on<AddStudentEvent>((event, emit){
      List<StudentsModel> students = [];
      event.insertData(event.data);
      students.add(event.data);
      students.addAll(state.students);
      emit(state.copyWith(students: students,state: state));
    });

    on<UpdateStudentEvent>((event, emit){
      event.updateData(event.data);
      state.students[event.index] = event.data;
      emit(state.copyWith(students: state.students,state: state));
    });

    on<RemoveStudentEvent>((event, emit){
      event.removeData(event.index);
      state.students.removeAt(event.id);
      emit(state.copyWith(state: state,students: state.students));
    } );
  }

}