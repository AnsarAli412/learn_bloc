import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc_flutter/bloc/basics/blocs/counter_states.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterBloc(),
      child: const CounterView(),
    );
  }
}

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Basics"),),
      body: Center(
        child: BlocBuilder<CounterBloc,int>(builder: (_,count)=>Text(count.toString())),
      ),
      floatingActionButton: Stack(
        children: [
          Positioned(
              bottom: 10,
              right: 10,
              child: FloatingActionButton(
                splashColor: Colors.green,
                onPressed: () {
                  context.read<CounterBloc>().add(CounterIncrementEvent());
                },
                child: const Icon(Icons.add),
              )),
          Positioned(
            bottom: 10,
            left: 40,
            child: FloatingActionButton(
                splashColor: Colors.red,
                onPressed: () {
                  context.read<CounterBloc>().add(CounterDecrementEvent());
                },
                child: const Icon(Icons.remove)),
          )
        ],
      ),
    );
  }
}
