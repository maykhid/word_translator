import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:word_translator/features/translator_app/domain/entities/translator.dart';
import 'package:word_translator/features/translator_app/domain/repositories/translator_repository.dart';
import 'package:mockito/mockito.dart';
import 'package:word_translator/features/translator_app/domain/usecases/get_translated_text.dart';

class MockTranslatorRepository extends Mock implements TranslatorRepository {}

void main() {
  late GetTranslatedText usecase;
  late MockTranslatorRepository mockTranslatorRepository;

  setUp(() {
    mockTranslatorRepository = MockTranslatorRepository();
    usecase = GetTranslatedText(mockTranslatorRepository);
  });

  const String tText = 'Hello';
  const tTranslatedText = Translation(
    text: 'Hallo',
    to: 'de',
  );
  const tTranslatedTextResult = TranslationResult(
    translations: [tTranslatedText],
  );

  test(
    'should get translated text from repository',
    () async {
      // arrange
      when(mockTranslatorRepository.getTranslatedText(any))
          .thenAnswer((_) async => const Right(tTranslatedTextResult));

      // act
      final result = await usecase(const Params(text: tText));

      // assert
      expect(result, const Right(tTranslatedTextResult));
      verify(mockTranslatorRepository.getTranslatedText(tText));
      verifyNoMoreInteractions(mockTranslatorRepository);
    },
  );
}
