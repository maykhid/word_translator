part of 'translator_bloc.dart';

abstract class TranslatorEvent extends Equatable {
  const TranslatorEvent();

  @override
  List<Object?> get props => [];
}

class GetTranslatedTextEvent extends TranslatorEvent {
  const GetTranslatedTextEvent(this.text);

  final String text;

  @override
  List<Object?> get props => [text];
}

class InitialEvent extends TranslatorEvent {}
