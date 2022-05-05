import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/util/clipboard_util.dart';

part 'clipboard_event.dart';
part 'clipboard_state.dart';

class ClipboardBloc extends Bloc<ClipboardEvent, ClipboardState> {
  ClipboardBloc() : super(ClipboardInitial()) {
    on<ClipboardEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<CopyEvent>((event, emit) async {
      emit(const OnLoading());
      await Clip.copy(event.text,
          callBack: (String result) => emit(const OnSuccessful()),
          onErrorCallback: () => emit(const OnError('Copy failed')));
    });

    on<PasteEvent>((event, emit) async {
      emit(const OnLoading());
      await Clip.paste(
          callback: (String result) => emit(OnSuccessful(text: result)),
          onErrorCallback: () => emit(const OnError('Paste failed')));
    });
  }
}
