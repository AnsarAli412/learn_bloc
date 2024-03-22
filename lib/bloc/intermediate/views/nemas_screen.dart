import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc_flutter/bloc/intermediate/blocs/names_bloc.dart';
import 'package:learn_bloc_flutter/bloc/intermediate/views/add_name_screen.dart';
import '../blocs/name_events.dart';
import '../blocs/name_states.dart';

class NamesScreen extends StatelessWidget {
  const NamesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Intermediate"),),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AddNameScreen(
                        name: "",index: -1,
                      )));
        },
        child: const Icon(Icons.add),
      ),
      body: BlocBuilder<NamesBloc, NamesState>(builder: (context, data) {
        var names = data.names;
        return names.isNotEmpty
            ? ListView.separated(
                itemBuilder: (_, index) {
                  return _nameItemView(names[index], index, context);
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider(
                    thickness: 1,
                  );
                },
                itemCount: names.length,
              )
            : const Center(
                child: Text("Add name"),
              );
      }),
    );
  }
}

Widget _nameItemView(String name, int index, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(name),
        Row(
          children: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddNameScreen(
                                name: name,
                                index: index,
                              )));
                },
                icon: const Icon(Icons.edit)),
            IconButton(
                onPressed: () {
                  context.read<NamesBloc>().add(RemoveNameEvent(index: index));
                },
                icon: const Icon(Icons.delete)),
          ],
        )
      ],
    ),
  );
}
