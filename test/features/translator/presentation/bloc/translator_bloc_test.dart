import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:word_translator/core/error/failures.dart';
import 'package:word_translator/features/translator_app/data/models/translator_model.dart';
import 'package:word_translator/features/translator_app/domain/entities/translator.dart';
import 'package:word_translator/features/translator_app/domain/usecases/get_translated_text.dart';
import 'package:word_translator/features/translator_app/presentation/bloc/translator_bloc.dart';

import 'translator_bloc_test.mocks.dart';

// class MockGetTranslatedText extends Mock implements GetTranslatedText {}
@GenerateMocks([GetTranslatedText])

void main() {
  late TranslatorBloc bloc;
  late MockGetTranslatedText mockGetTranslatedText;

  setUp(() {
    mockGetTranslatedText = MockGetTranslatedText();
    bloc = TranslatorBloc(mockGetTranslatedText);
  });

  test('initialState should be EmptyState', () {
    // assert
    expect(bloc.state, equals(EmptyState()));
  });

  group(
    'GetTranslatedTextEvent',
    () {
      const tText = 'Hello';
      const tTranslatorModel = TranslationModel(
        text: 'Hallo',
        to: 'de',
      );
      const TranslationResultModel tTranslatorResultModel =
          TranslationResultModel(
        translations: [tTranslatorModel],
      );
      const TranslationResult tTranslatorResult = tTranslatorResultModel;

      test(
        'should get data from GetTranslatedText use case',
        () async {
          // arrange
          when(mockGetTranslatedText(any))
              .thenAnswer((_) async => const Right(tTranslatorResult));
          // act
          bloc.add(const GetTranslatedTextEvent(tText));
          await untilCalled(mockGetTranslatedText(any));
          // expect(bloc.state, emitsInOrder([EmptyState(), ]))
          // assert
          verify(mockGetTranslatedText(const Params(text: tText)));
        },
      );

      blocTest<TranslatorBloc, TranslatorState>(
        'emits [LoadingState, LoadedState] on GetTranslatedText when successful.',
        setUp: () {
          when(mockGetTranslatedText(any))
              .thenAnswer((_) async => const Right(tTranslatorResult));
        },
        build: () => TranslatorBloc(mockGetTranslatedText),
        act: (bloc) => bloc.add(const GetTranslatedTextEvent(tText)),
        expect: () => <TranslatorState>[LoadingState(), const LoadedState(result: tTranslatorResult)],
        verify: (_) => verify(mockGetTranslatedText(const Params(text: tText))),
      );

      blocTest<TranslatorBloc, TranslatorState>(
        'emits [LoadingState, ErrorState] on GetTranslatedText when unsuccessful.',
        setUp: () {
          when(mockGetTranslatedText(any))
              .thenAnswer((_) async => Left(ServerFailure()));
        },
        build: () => TranslatorBloc(mockGetTranslatedText),
        act: (bloc) => bloc.add(const GetTranslatedTextEvent(tText)),
        expect: () => <TranslatorState>[LoadingState(), const ErrorState(SERVER_FAILURE_MESSAGE)],
        verify: (_) => verify(mockGetTranslatedText(const Params(text: tText))),
      );
    },
  );
}
