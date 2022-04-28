part of 'from_to_bloc.dart';

abstract class FromToEvent extends Equatable {
  const FromToEvent();

  @override
  List<Object?> get props => [];
}

class GetFromLangEvent extends FromToEvent {
  const GetFromLangEvent(this.selectedItem, this.langs);

  final String? selectedItem;
  final List<Languages>? langs;

  @override
  List<Object?> get props => [selectedItem, langs];
}

class GetToLangEvent extends FromToEvent {
  const GetToLangEvent(this.selectedItem, this.langs);

  final String? selectedItem;
  final List<Languages>? langs;

  @override
  List<Object?> get props => [selectedItem, langs];
}
