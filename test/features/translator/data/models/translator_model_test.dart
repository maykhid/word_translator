import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:word_translator/features/translator_app/data/models/translator_model.dart';
import 'package:word_translator/features/translator_app/domain/entities/translator.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  const translatorModel = TranslationModel(
    text: "Hallo Welt! Das ist Henry, der spricht",
    to: 'de',
  );

  final List<TranslationModel> translations = [translatorModel];

  final translatorResult = TranslatorResultModel(translations: translations);

  test(
    'should be a subclass of Translations entity',
    () async {
      // assert
      expect(translatorModel, isA<Translation>());
    },
  );

  test(
    'should be a subclass of Translator entity',
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
              json.decode(fixture('translation.json'));

          // act
          final result = TranslatorResultModel.fromJson(jsonMap);

          // assert
          expect(result, translatorResult);
        },
      );

      test(
        'should return a valid model when JSON is map',
        () async {
          // arrange
          final List<dynamic> jsonMap =
              json.decode(fixture('translation.json'));
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
