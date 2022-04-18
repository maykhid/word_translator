import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:word_translator/core/error/exceptions.dart';
import 'package:word_translator/core/error/failures.dart';
import 'package:word_translator/core/network/network_info.dart';
import 'package:word_translator/features/translator_app/data/datasources/translator_remote_data_src.dart';
import 'package:word_translator/features/translator_app/data/models/translator_model.dart';
import 'package:word_translator/features/translator_app/data/repositories/translator_repository_impl.dart';
import 'package:word_translator/features/translator_app/domain/entities/translator.dart';

class MockRemoteDataSource extends Mock implements TranslatorRemoteDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  late TranslatorRepositoryImpl repository;
  late MockRemoteDataSource mockRemoteDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = TranslatorRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

  void runTestsOnline(Function body) {
    group('device is online', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });

      body();
    });
  }

  void runTestsOffline(Function body) {
    group('device is offline', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });

      body();
    });
  }

  group(
    'getTranslatedText',
    () {
      const tText = 'Hello';
      const tTranslatorModel = TranslationModel(
        text: tText,
        to: 'en',
      );
      const TranslatorResultModel tTranslatorResultModel =
          TranslatorResultModel(
        translations: [tTranslatorModel],
      );
      const TranslationResult tTranslatorResult = tTranslatorResultModel;
      test(
        'should check if the device is online',
        () async {
          // arrange
          when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
          // act
          repository.getTranslatedText(tText);
          // assert
          verify(mockNetworkInfo.isConnected);
        },
      );

      runTestsOnline(() {
          test(
            'should return remote data when call to remote data source is successful',
            () async {
              // arrange
              when(mockRemoteDataSource.getTranslatedText(any))
                  .thenAnswer((_) async => tTranslatorResultModel);

              // act
              final result = await repository.getTranslatedText(tText);

              // assert
              verify(mockRemoteDataSource.getTranslatedText(tText));
              expect(result, equals(const Right(tTranslatorResult)));
            },
          );

          test(
            'should return server failure when call to remote data source is unsuccessful',
            () async {
              // arrange
              when(mockRemoteDataSource.getTranslatedText(any))
                  .thenThrow(ServerException());

              // act
              final result = await repository.getTranslatedText(tText);

              // assert
              verify(mockRemoteDataSource.getTranslatedText(tText));
              expect(result, equals(Left(ServerFailure())));
            },
          );
        },
      );

      runTestsOffline(
        () {
          test(
            'should return network failure if the device is offline',
            () async {
              // act
              final result = await repository.getTranslatedText(tText);

              // assert
              verifyNever(mockRemoteDataSource.getTranslatedText(any));
              expect(result, equals(Left(NetworkFailure())));
            },
          );
        },
      );
    },
  );
}
