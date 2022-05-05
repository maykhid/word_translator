import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'core/network/network_info.dart';
import 'features/translator_app/data/datasources/translator_remote_data_src.dart';
import 'features/translator_app/domain/repositories/translator_repository.dart';
import 'features/translator_app/domain/usecases/get_translated_text.dart';
import 'features/translator_app/presentation/bloc/translator_bloc/translator_bloc.dart';

import 'features/translator_app/data/repositories/translator_repository_impl.dart';

final di = GetIt.instance;

/// Note to self: registerFactory instantiates a new instance of the given class whenever you request for it.
/// Whenever you use class that has a dispose logic you should use registerFactory.
/// 
/// registerLazySingleton always grants you an already instantiated 'instance' of the given class whenever you request for it.
/// A registerLazySingleton grants an instance only on a request basis (if you request for it) while normal Singleton is registered immediately after the app starts.
Future<void> init() async {
  //! Features - Translator
  // Bloc
  di.registerFactory(
    () => TranslatorBloc(
      di(),
    ),
  );

  // Use cases
  di.registerLazySingleton(
    () => GetTranslatedText(
      di(),
    ),
  );

  // Repository
  di.registerLazySingleton<TranslatorRepository>(
    () => TranslatorRepositoryImpl(
      networkInfo: di(),
      remoteDataSource: di(),
    ),
  );

  // Data sources
  di.registerLazySingleton<TranslatorRemoteDataSource>(
    () => TranslatorRemoteDataSourceImpl(
      client: di(),
    ),
  );

  //! Core
  di.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(
      di(),
    ),
  );

  //! External
  di.registerLazySingleton(() => http.Client());
  di.registerLazySingleton(() => DataConnectionChecker());
}
