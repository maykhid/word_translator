import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/translator.dart';
import '../repositories/translator_repository.dart';

/// This class is responsible for getting translated text from the repository

class GetTranslatedText implements UseCase<TranslationResult?, Params> {
  final TranslatorRepository translatorRepository;

  GetTranslatedText(this.translatorRepository);

  // call makes it possible to call this usecase by just using the instance of this class e.g [usecase]
  @override
  Future<Either<Failure, TranslationResult?>?> call(Params params) async {
    return await translatorRepository.getTranslatedText(params.text);
  }
}

class Params extends Equatable {
  final String? text;

  const Params({this.text});

  @override
  List<Object?> get props => [text];
}
