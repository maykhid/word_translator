import 'dart:convert';

import '../../../../core/error/exceptions.dart';
import '../../../../secrets.dart';
import '../models/translate_body_model.dart';
import '../models/translator_model.dart';
import 'package:http/http.dart' as http;

abstract class TranslatorRemoteDataSource {
  /// Calls the Translator API and returns a [TranslationResultModel]
  ///
  /// Throws a [ServerException] for all error codes.
  Future<TranslationResultModel>? getTranslatedText(String? text);
}

class TranslatorRemoteDataSourceImpl implements TranslatorRemoteDataSource {
  final http.Client client;
  late TranslateBodyModel? translateBodyModel;

  TranslatorRemoteDataSourceImpl({required this.client});

  Map<String, String> requestHeaders = {
    'Content-type': 'application/json',
    'Ocp-Apim-Subscription-Key': secretKey,
    'Ocp-Apim-Subscription-Region': 'global',
  };

  @override
  Future<TranslationResultModel>? getTranslatedText(String? text) async {
    translateBodyModel = TranslateBodyModel(text: text);
    final response = await client.post(
      Uri.https(
        'api.cognitive.microsofttranslator.com',
        '/translate',
        {'api-version': '3.0', 'from': 'en', 'to': 'de'},
      ),
      body: translateBodyModel!.toJson(),
      headers: requestHeaders,
    );

    if(response.statusCode == 200) {
      return TranslationResultModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
   
  }
}
