import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc_flutter/intermediate/blocs/names_bloc.dart';
import 'package:learn_bloc_flutter/sqflite/bloc/student_bloc.dart';
import 'package:learn_bloc_flutter/sqflite/views/students_screen.dart';


void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider<NamesBloc>(create: (_)=>NamesBloc()),
    BlocProvider<StudentBloc>(create: (_)=>StudentBloc()),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Bloc',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false,
      ),
      home: const StudentsScreen(),
    );
  }
}
