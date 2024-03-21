
import '../models/students_model.dart';

class StudentState {
  final List<StudentsModel> students;

  const StudentState({this.students = const <StudentsModel>[]});

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
