import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc_flutter/sqflite/bloc/student_bloc.dart';
import 'package:learn_bloc_flutter/sqflite/bloc/student_events.dart';
import 'package:learn_bloc_flutter/sqflite/models/students_model.dart';
import 'package:learn_bloc_flutter/sqflite/views/add_student_screen.dart';
import 'package:learn_bloc_flutter/sqflite/views/update_student_screen.dart';

class StudentsWidgets{
  BuildContext context;
  StudentsWidgets({required this.context});

  AppBar appBarView()=> AppBar(title: const Text("Students"),actions: [
    IconButton(onPressed: (){
      Navigator.push(context, MaterialPageRoute(builder: (_)=>AddStudentScreen()));
    }, icon: const Icon(Icons.add,))
  ],);

  Widget studentsItemView(StudentsModel data,int index){
    return Card(
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(data.name,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                Text("Email: ${data.email}"),
                Text("Phone: ${data.phone}"),
                Text("Gender: ${data.gender}"),
                Text("Marital Status ${data.isMarried == 1?"Married":"Unmarried"}"),
              ],
            ),
            Column(
              children: [
                IconButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_)=>UpdateStudentScreen(data: data,index: index,)));
                }, icon: const Icon(Icons.edit,color: Colors.deepPurple,)),
                IconButton(onPressed: (){
                  showDeleteStudentDialog(data.name,index,data.id??0);
                }, icon: const Icon(Icons.delete,color: Colors.red,)),
              ],
            )
          ],
        ),
      ),
    );

  }

  showDeleteStudentDialog(String title,int index,int id){
    return showDialog(context: context, builder: (_)=>AlertDialog(
      contentPadding: const EdgeInsets.symmetric(horizontal: 10),
      title: Text("Delete $title!"),
      content: const Text("Do you really want to delete?"),
      actions: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            onPressed: (){
            context.read<StudentBloc>().add(RemoveStudentEvent(index,id));
            Navigator.pop(context);
            }, child: const Text("Yes")),
        const SizedBox(width: 10,),
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            onPressed: (){
            Navigator.pop(context);
            }, child: const Text("No"))
      ],
    ));
  }
}