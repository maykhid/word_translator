import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/translator.dart';
import '../repositories/translator_repository.dart';

class GetTranslatedText {
  final TranslatorRepository translatorRepository;

  GetTranslatedText(this.translatorRepository);

  Future<Either<Failure, Translations>?> execute({required String text}) async {
    return await translatorRepository.getTranslatedText(text);
  }
}
