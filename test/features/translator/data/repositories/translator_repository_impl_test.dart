import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:word_translator/core/platform/network_info.dart';
import 'package:word_translator/features/translator_app/data/datasources/translator_remote_data_src.dart';
import 'package:word_translator/features/translator_app/data/repositories/translator_repository_impl.dart';

class MockRemoteDataSource extends Mock implements TranslatorRemoteDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  TranslatorRepositoryImpl repository;
  MockRemoteDataSource mockRemoteDataSource;
  MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = TranslatorRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      networkInfo: mockNetworkInfo,
    );
  });
}
