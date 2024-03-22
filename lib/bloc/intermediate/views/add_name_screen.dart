import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc_flutter/bloc/intermediate/blocs/names_bloc.dart';

import '../blocs/name_events.dart';

class AddNameScreen extends StatelessWidget {
  final String name;
  final int index;
   AddNameScreen({super.key,required this.name, required this.index});

  var nameController = TextEditingController();

  final nameKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    nameController = TextEditingController(text: name);
    return Scaffold(
      appBar: AppBar(
        title: Text(index == -1?"Add Name":"Update Name"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: nameKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(border: OutlineInputBorder(),hintText: "Enter name"),
                controller: nameController,
                validator: (text) =>
                    text?.isEmpty == true ? "Please enter name" : null,
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                   if(nameKey.currentState!.validate()){
                     if(name == ""){
                       context
                           .read<NamesBloc>()
                           .add(AddNameEvent(name: nameController.text));
                     }else{
                       context
                           .read<NamesBloc>()
                           .add(UpdateNameEvent(name: nameController.text, index: index,));
                     }
                     Navigator.pop(context);
                   }
                  },
                  child: Text(index == -1?"Add Name":"Update Name"))
            ],
          ),
        ),
      ),
    );
  }
}
