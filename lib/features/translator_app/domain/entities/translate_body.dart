import 'package:equatable/equatable.dart';

class TranslateBody extends Equatable{
  final String? text;

  const TranslateBody({this.text});

  @override
  List<Object?> get props => [text];
}
