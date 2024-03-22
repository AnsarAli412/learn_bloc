class NamesState {
  final List<String> names;

  const NamesState({this.names = const <String>[]});

  NamesState copyWith({List<String> names1 = const [], NamesState? state}) {
    if (state != null) {
      return NamesState(names: names1);
    } else {
      return NamesState(names: names1);
    }
  }
}

class NameInitState extends NamesState {}