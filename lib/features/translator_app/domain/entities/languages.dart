import 'package:equatable/equatable.dart';

class Languages extends Equatable {
  const Languages({
    this.name,
    this.nativeName,
    this.code,
  });

  final String? name;
  final String? nativeName;
  final String? code;

  @override
  List<Object?> get props => [name, nativeName, code];
}
