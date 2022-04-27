import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:word_translator/core/error/exceptions.dart';
import 'package:word_translator/features/translator_app/data/datasources/translator_remote_data_src.dart';
import 'package:word_translator/features/translator_app/data/models/translator_body_model.dart';
import 'package:word_translator/features/translator_app/data/models/translator_model.dart';
import 'package:word_translator/secrets.dart';

// ignore: avoid_relative_lib_imports
import '../../../../../lib/core/util/fixture_reader.dart';
import 'translator_remote_data_src_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  late TranslatorRemoteDataSourceImpl translatorRemoteDataSource;
  late MockClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockClient();
    translatorRemoteDataSource =
        TranslatorRemoteDataSourceImpl(client: mockHttpClient);
  });

  void setUpMockHttpClientSuccess200() {
    when(mockHttpClient.post(
      any,
      headers: anyNamed('headers'),
      body: anyNamed('body'),
    )).thenAnswer((_) async => http.Response(
          fixtureTest('translation.json'),
          200,
        ));
  }

  void setUpMockHttpClientFailure404() {
    when(mockHttpClient.post(
      any,
      headers: anyNamed('headers'),
      body: anyNamed('body'),
    )).thenAnswer((_) async => http.Response(
          'Something went wrong',
          404,
        ));
  }

  group(
    'getTranslatedText',
    () {
      const tText = 'Hello';
      const String tTo = 'de';
      const String tFrom = 'en';

      const tTranslateBody = TranslatorBodyModel(text: tText);
      final tTranslationResultModel = TranslationResultModel.fromJson(
        json.decode(
          fixtureTest('translation.json'),
        ),
      );

      Map<String, String> requestHeaders = {
        'Content-type': 'application/json',
        'Ocp-Apim-Subscription-Key': secretKey,
        'Ocp-Apim-Subscription-Region': 'global',
      };

      test(
        'should perform a Get request on a URL with text',
        () async {
          // arrange
          setUpMockHttpClientSuccess200();
          // act
          translatorRemoteDataSource.getTranslatedText(tText, tFrom, tTo);
          // assert
          verify(
            mockHttpClient.post(
              Uri.https(
                'api.cognitive.microsofttranslator.com',
                '/translate',
                {'api-version': '3.0', 'from': tFrom, 'to': tTo},
              ),
              body: jsonEncode([tTranslateBody.toJson()]),
              headers: requestHeaders,
            ),
          );
        },
      );

      test(
        'should return $TranslationModel when the response code is 200 (success)',
        () async {
          // arrange
          setUpMockHttpClientSuccess200();
          // act
          final result =
              await translatorRemoteDataSource.getTranslatedText(tText, tFrom, tTo);
          // assert
          expect(result, equals(tTranslationResultModel));
        },
      );

      test(
        'should throw $ServerException implements Exception when the response code is 404 or other',
        () async {
          // arrange
          setUpMockHttpClientFailure404();
          // act
          final call = translatorRemoteDataSource.getTranslatedText;
          // assert
          expect(
              () => call(tText, tFrom, tTo), throwsA(const TypeMatcher<ServerException>()));
        },
      );
    },
  );
}
