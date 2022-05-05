import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'features/translator_app/presentation/bloc/clipboard_bloc/clipboard_bloc.dart';

import 'dependency_injector.dart' as di;
import 'features/translator_app/presentation/bloc/from_to_bloc/from_to_bloc.dart';
import 'features/translator_app/presentation/bloc/translator_bloc/translator_bloc.dart';
import 'features/translator_app/presentation/pages/translator_page.dart';

void main() async {
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider<TranslatorBloc>(
              create: (context) => GetIt.instance<TranslatorBloc>(),
            ),
            BlocProvider<FromToBloc>(
              create: (context) => FromToBloc(),
            ),
            BlocProvider<ClipboardBloc>(
              create: (context) => ClipboardBloc(),
            ),
        ],
        child: const TranslatorPage(),
      ),
    );
  }
}
