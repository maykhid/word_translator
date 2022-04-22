import '../../domain/entities/translate_body.dart';

class TranslatorBodyModel extends TranslateBody {
  const TranslatorBodyModel({
    required String? text,
  }) : super(text: text);

  factory TranslatorBodyModel.fromJson(List<dynamic> json) {
    return TranslatorBodyModel(
      text: json[0]['text'],
    );
  }

  Map<String, dynamic> toJson() => {
        "text": text,
      };
}
