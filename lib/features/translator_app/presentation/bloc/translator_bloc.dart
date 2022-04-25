import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:word_translator/features/translator_app/domain/entities/translator.dart';

import '../../domain/usecases/get_translated_text.dart';

part 'translator_event.dart';
part 'translator_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';

class TranslatorBloc extends Bloc<TranslatorEvent, TranslatorState> {
  // final GetTranslatedText getTranslatedText;

  TranslatorBloc(GetTranslatedText getTranslatedText) : super(EmptyState()) {
    on<InitialEvent>((event, emit) async {
      emit(EmptyState());
    });

    // The event for GetTranslatedText
    on<GetTranslatedTextEvent>(
      (event, emit) async {
        if (state is EmptyState || state is LoadingState || state is LoadedState || state is ErrorState) {
          emit(LoadingState());
          final failureOrTranslationResult =
              await getTranslatedText(Params(text: event.text));

          emit(failureOrTranslationResult!.fold(
            (l) => const ErrorState(SERVER_FAILURE_MESSAGE),
            (r) => LoadedState(result: r),
          ));
        }
      },
    );
  }
}