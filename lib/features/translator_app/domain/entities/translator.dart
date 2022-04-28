// Here lies the object entity for translation

import 'package:equatable/equatable.dart';

class TranslationResult extends Equatable{
  final List<Translation>? translations;

  const TranslationResult({this.translations});

  @override
  List<Object?> get props => [translations];
}

class Translation extends Equatable{
  final String? text;
  final String? to;

  const Translation({this.text, this.to});

  @override
  List<Object?> get props => [text, to];
}
