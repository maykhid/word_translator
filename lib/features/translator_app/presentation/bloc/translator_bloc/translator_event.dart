part of 'translator_bloc.dart';

abstract class TranslatorEvent extends Equatable {
  const TranslatorEvent();

  @override
  List<Object?> get props => [];
}

class GetTranslatedTextEvent extends TranslatorEvent {
  const GetTranslatedTextEvent(this.text, this.from, this.to);

  final String? text;
  final String? from;
  final String? to;

  @override
  List<Object?> get props => [text, from, to];
}

class InitialEvent extends TranslatorEvent {}
