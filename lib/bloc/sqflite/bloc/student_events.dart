

import 'package:learn_bloc_flutter/bloc/intermediate/database/databse_helper.dart';
import 'package:learn_bloc_flutter/bloc/sqflite/models/students_model.dart';

class StudentEvent with DatabaseHelper{
   StudentEvent();
}

class AddStudentEvent extends StudentEvent{
  final StudentsModel data;
   AddStudentEvent(this.data);
}

class UpdateStudentEvent extends StudentEvent{
  final int index;
  final StudentsModel data;
   UpdateStudentEvent(this.data,this.index);
}

class RemoveStudentEvent extends StudentEvent{
  final int index;
  final int id;
   RemoveStudentEvent(this.index, this.id);
}

class GetStudentsEvent extends StudentEvent{

}