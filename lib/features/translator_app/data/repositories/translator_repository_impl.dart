// Implements translator repository which is in the domain layer

import 'package:dartz/dartz.dart';
import 'package:word_translator/core/error/exceptions.dart';
import 'package:word_translator/core/error/failures.dart';
import 'package:word_translator/features/translator_app/domain/entities/translator.dart';

import '../../../../core/network/network_info.dart';
import '../../domain/repositories/translator_repository.dart';
import '../datasources/translator_remote_data_src.dart';

class TranslatorRepositoryImpl implements TranslatorRepository {
  final TranslatorRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  TranslatorRepositoryImpl(
      {required this.remoteDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, TranslationResult?>>? getTranslatedText(
    String? text,
  ) async {
    if (await networkInfo.isConnected ?? false) {
      try {
        final remoteTranslatorResult = await remoteDataSource.getTranslatedText(
          text,
        );
        return Right(remoteTranslatorResult);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }
}
