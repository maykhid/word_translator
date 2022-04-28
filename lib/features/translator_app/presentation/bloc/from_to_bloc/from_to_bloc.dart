import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../domain/entities/languages.dart';

part 'from_to_event.dart';
part 'from_to_state.dart';

class FromToBloc extends Bloc<FromToEvent, FromToState> {
  FromToBloc() : super(const FromToState.initial()) {
    // on<FromToEvent>((event, emit) async {
    //   emit(const FromToInitial(from: 'en', to: 'fr'));
    // });

    on<GetFromLangEvent>((event, emit) async {
      debugPrint('GetFromLangEvent');
      var list = event.langs!.map((e) => e.name).toList();
      var listOfLangCodes = event.langs!.map((e) => e.code).toList();
      var from = listOfLangCodes[list.indexOf(event.selectedItem)].toString();
      emit(FromToState.fromLoaded(from: from, to: state.to));
      debugPrint('This is \'from\' event: $from, $state.to');
    });

    on<GetToLangEvent>((event, emit) {
      debugPrint('GetFromLangEvent');
      var list = event.langs!.map((e) => e.name).toList();
      var listOfLangCodes = event.langs!.map((e) => e.code).toList();
      var to = listOfLangCodes[list.indexOf(event.selectedItem)].toString();
      emit(FromToState.toLoaded(from: state.from, to: to));
      debugPrint('This is \'to\' event: ${state.from} to: $to');
    });
  }
}
