import 'package:equatable/equatable.dart';

class NamesEven extends Equatable {
  const NamesEven();

  @override
  List<Object?> get props => [];
}

class AddNameEvent extends NamesEven {
  final String name;

  const AddNameEvent({required this.name});
}

class UpdateNameEvent extends NamesEven {
  final String name;
  final int index;

  const UpdateNameEvent({required this.index, required this.name});
}

class GetNameEvent extends NamesEven {}

class RemoveNameEvent extends NamesEven {
  final int index;

  const RemoveNameEvent({required this.index});
}