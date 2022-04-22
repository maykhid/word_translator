import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:word_translator/core/error/exceptions.dart';
import 'package:word_translator/features/translator_app/data/datasources/translator_remote_data_src.dart';
import 'package:word_translator/features/translator_app/data/models/translate_body_model.dart';
import 'package:word_translator/features/translator_app/data/models/translator_model.dart';
import 'package:word_translator/secrets.dart';

import '../../../../fixtures/fixture_reader.dart';
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
          fixture('translation.json'),
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
      const tTranslateBody = TranslateBodyModel(text: tText);
      final tTranslationResultModel = TranslationResultModel.fromJson(
        json.decode(
          fixture('translation.json'),
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
          translatorRemoteDataSource.getTranslatedText(tText);
          // assert
          verify(
            mockHttpClient.post(
              Uri.https(
                'api.cognitive.microsofttranslator.com',
                '/translate',
                {'api-version': '3.0', 'from': 'en', 'to': 'de'},
              ),
              body: tTranslateBody.toJson(),
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
              await translatorRemoteDataSource.getTranslatedText(tText);
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
              () => call(tText), throwsA(const TypeMatcher<ServerException>()));
        },
      );
    },
  );
}