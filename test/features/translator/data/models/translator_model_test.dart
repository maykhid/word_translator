import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:word_translator/features/translator_app/data/models/translator_model.dart';
import 'package:word_translator/features/translator_app/domain/entities/translator.dart';

// ignore: avoid_relative_lib_imports
import '../../../../../lib/core/util/fixture_reader.dart';

void main() {
  const translatorModel = TranslationModel(
    text: "Hallo Welt! Das ist Henry, der spricht",
    to: 'de',
  );

  final List<TranslationModel> translations = [translatorModel];

  final translatorResult = TranslationResultModel(translations: translations);

  test(
    'should be a subclass of $Translation entity',
    () async {
      // assert
      expect(translatorModel, isA<Translation>());
    },
  );

  test(
    'should be a subclass of $TranslationResult entity',
    () async {
      // assert
      expect(translatorResult, isA<TranslationResult>());
    },
  );

  group(
    'fromJson',
    () {
      test(
        'should return a valid model when JSON is dynamic List (of map)',
        () async {
          // arrange
          final List<dynamic> jsonMap =
              json.decode(fixtureTest('translation.json'));

          // act
          final result = TranslationResultModel.fromJson(jsonMap);

          // assert
          expect(result, translatorResult);
        },
      );

      test(
        'should return a valid model when JSON is map',
        () async {
          // arrange
          final List<dynamic> jsonMap =
              json.decode(fixtureTest('translation.json'));
          // act
          final result =
              TranslationModel.fromJson(jsonMap[0]['translations'][0]);

          // assert
          expect(result, translatorModel);
        },
      );
    },
  );
}
