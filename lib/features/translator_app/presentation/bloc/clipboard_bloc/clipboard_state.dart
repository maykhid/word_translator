part of 'clipboard_bloc.dart';

abstract class ClipboardState extends Equatable {
  const ClipboardState();

  @override
  List<Object?> get props => [];
}

class ClipboardInitial extends ClipboardState {}

class OnLoading extends ClipboardState {
  const OnLoading();

  @override
  List<Object?> get props => [];
}

class OnSuccessful extends ClipboardState {
  final String? text;

  const OnSuccessful({this.text});

  @override
  List<Object?> get props => [text];
}

class OnError extends ClipboardState {
  final String? message;

  const OnError(this.message);

  @override
  List<Object?> get props => [message];
}
