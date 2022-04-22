import '../../domain/entities/translate_body.dart';

class TranslateBodyModel extends TranslateBody {
  const TranslateBodyModel({
    required String? text,
  }) : super(text: text);

  factory TranslateBodyModel.fromJson(Map<String, dynamic> json) {
    return TranslateBodyModel(
      text: json['text'],
    );
  }

  Map<String, dynamic> toJson() => {
        "text": text,
      };
}
