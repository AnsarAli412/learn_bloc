import 'package:flutter_bloc/flutter_bloc.dart';

import 'name_events.dart';
import 'name_states.dart';

class NamesBloc extends Bloc<NamesEven, NamesState> {
  NamesBloc() : super(NameInitState()) {
    on<AddNameEvent>((event, emit) {
      List<String> names = [];
      names.add(event.name);
      names.addAll(state.names);
      emit(state.copyWith(names1: names, state: state));
    });

    on<RemoveNameEvent>((event, emit) {
      state.names.removeAt(event.index);
      emit(state.copyWith(names1: state.names, state: state));
    });

    on<UpdateNameEvent>((event, emit) {
      state.names[event.index] = event.name;
      emit(state.copyWith(state: state, names1: state.names));
    });

  }
}
