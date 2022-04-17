import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/translator.dart';

abstract class TranslatorRepository {
  Future<Either<Failure, Translation>>? getTranslatedText(String? text);
}
