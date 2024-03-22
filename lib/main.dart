import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:learn_bloc_flutter/bloc/intermediate/blocs/names_bloc.dart';
import 'package:learn_bloc_flutter/bloc/sqflite/bloc/student_bloc.dart';
import 'package:learn_bloc_flutter/views/intro_screen.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider<NamesBloc>(create: (_)=>NamesBloc()),
    BlocProvider<StudentBloc>(create: (_)=>StudentBloc()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter State Management',
      theme: ThemeData(
        floatingActionButtonTheme: const FloatingActionButtonThemeData(backgroundColor: Colors.deepPurple),
        iconTheme: const IconThemeData(color: Colors.deepPurple),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false,
      ),
      home: const IntroScreen(),
    );
  }
}
