import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:word_translator/features/translator_app/data/models/translator_body_model.dart';
import 'package:word_translator/features/translator_app/domain/entities/translate_body.dart';

// ignore: avoid_relative_lib_imports
import '../../../../../lib/core/util/fixture_reader.dart';

void main() {
  const translatorBodyModel = TranslatorBodyModel(text: "Hello world! This is henry speaking");

  test('should be a subclass of $TranslateBody entity', () async {
    // assert
    expect(translatorBodyModel, isA<TranslateBody>());
  });

  group(
    'fromJson',
    () {
      test(
        'should return a valid model when JSON is passed',
        () {
          // arrange
          final List<dynamic> jsonMap = json.decode(fixture('text_body.json'));
          // act
          final result = TranslatorBodyModel.fromJson(jsonMap);
          // assert
          expect(result, translatorBodyModel);
        },
      );
    },
  );
}
