
import '../models/students_model.dart';

class StudentState {
  List<StudentsModel> students = [];

   StudentState({this.students = const []});

  StudentState copyWith(
      {List<StudentsModel> students = const [], StudentState? state}) {
    if (state != null) {
      return StudentState(students: students);
    } else {
      return StudentState(students: students);
    }
  }
}

class StudentInitState extends StudentState{}
