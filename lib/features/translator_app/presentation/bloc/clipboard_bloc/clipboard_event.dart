part of 'clipboard_bloc.dart';

abstract class ClipboardEvent extends Equatable {
  const ClipboardEvent();

  @override
  List<Object?> get props => [];
}

class CopyEvent extends ClipboardEvent {
  const CopyEvent(this.text);

  final String? text;

  @override
  List<Object?> get props => [text];
}

class PasteEvent extends ClipboardEvent {

  const PasteEvent();
  
  @override
  List<Object?> get props => [];
}
