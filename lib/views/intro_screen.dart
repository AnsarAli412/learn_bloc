import 'package:flutter/material.dart';
import 'package:learn_bloc_flutter/bloc/basics/views/counter_screen.dart';
import 'package:learn_bloc_flutter/bloc/intermediate/views/nemas_screen.dart';
import 'package:learn_bloc_flutter/bloc/sqflite/views/students_screen.dart';
import '../get/basic/views/get_basic_screen.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("State Management"),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        children: [
          _titleView("Bloc"),
          _divider(thick: 2),
          _itemView("Basic", const CounterScreen(), context),
          _divider(),
          _itemView("Intermediate", const NamesScreen(), context),
          _divider(),
          _itemView("Advance", const StudentsScreen(), context),
          _divider(thick: 2),
          _titleView("GetX"),
          _divider(thick: 2),
          _itemView("Basic", const GetBasicScreen(), context),
          _divider(),
          _itemView("Intermediate", const NamesScreen(), context),
          _divider(),
          _itemView("Advance", const StudentsScreen(), context),
          _divider(thick: 2),
          _titleView("Providers"),
          _divider(thick: 2),
          _itemView("Basic", const CounterScreen(), context),
          _divider(),
          _itemView("Intermediate", const NamesScreen(), context),
          _divider(),
          _itemView("Advance", const StudentsScreen(), context),
        ],
      ),
    );
  }

  Widget _titleView(String title) => Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      );

  Widget _itemView(String type, Widget targetView, BuildContext context) =>
      InkWell(
        child: Text(type),
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => targetView));
        },
      );

  Widget _divider({double thick = 1}) => Divider(
        thickness: thick,
      );
}
