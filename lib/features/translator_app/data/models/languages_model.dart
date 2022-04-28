import 'dart:convert';

import 'package:word_translator/features/translator_app/domain/entities/languages.dart';

List<Languages> languagesFromJson(String str) => List<Languages>.from(json.decode(str).map((x) => LanguagesModel.fromJson(x)));

String languagesToJson(List<LanguagesModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LanguagesModel extends Languages {
  const LanguagesModel({
    required String? name,
    required String? nativeName,
    required String? code,
  }) : super(
          name: name,
          nativeName: nativeName,
          code: code,
        );

  factory LanguagesModel.fromJson(Map<String, dynamic> json) {
    return LanguagesModel(
      name: json['name'],
      nativeName: json['nativeName'],
      code: json['code'],
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "nativeName": nativeName,
        "code": code,
      };
}