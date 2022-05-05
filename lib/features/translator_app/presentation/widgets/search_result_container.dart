import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../bloc/clipboard_bloc/clipboard_bloc.dart';
import '../bloc/translator_bloc/translator_bloc.dart';
import '../notifiers/notifiers.dart';

class SearchResultContainer extends StatefulWidget {
  final Widget prefferedWidget;
  const SearchResultContainer({
    Key? key,
    required this.prefferedWidget,
  }) : super(key: key);

  @override
  State<SearchResultContainer> createState() => _SearchResultContainerState();
}

class _SearchResultContainerState extends State<SearchResultContainer> {
  @override
  Widget build(BuildContext context) {
    final translatorstate = context.watch<TranslatorBloc>().state;
    final clipboardstate = context.watch<ClipboardBloc>().state;
    return Container(
      height: 200,
      width: MediaQuery.of(context).size.width * 0.9,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // translated text
          Scrollbar(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              reverse: true,
              child: SizedBox(
                height: 110,
                width: MediaQuery.of(context).size.width * 0.70,
                // color: Colors.black,
                child: widget.prefferedWidget,
              ),
            ),
          ),

          Container(
            // padding: const EdgeInsets.symmetric(horizontal: 10),
            height: 35,
            width: MediaQuery.of(context).size.width,
            decoration: ShapeDecoration(
              color: Colors.grey.withOpacity(0.1),
              shape: const CircleBorder(),
            ),
            child: Center(
              child: IconButton(
                onPressed: () {
                  // if (state is LoadedState) {
                  //   Clip.copy(state.result!.translations![0].text,
                  //       callBack: (String result) {});
                  // }
                  // // Todo: refactor this snackbar code
                  // else {
                  //   Notifiers.showToast('An error occured while copying');
                  // }
                  if (translatorstate is LoadedState) {
                    dispatchCopy(translatorstate.result!.translations![0].text,
                        clipboardstate);
                  }
                },
                icon: FaIcon(
                  FontAwesomeIcons.copy,
                  color: translatorstate is LoadedState
                      ? Colors.black
                      : Colors.black.withOpacity(0.3),
                  size: 15,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void dispatchCopy(String? text, ClipboardState state) {
    BlocProvider.of<ClipboardBloc>(context).add(CopyEvent(text));
    if (state is OnLoading) {
      Notifiers.showToast('Please wait...');
    } else if (state is OnSuccessful) {
      Notifiers.showToast('Copied to clipboard.');
    } else {
      Notifiers.showToast('An error occured while copying. Please try again');
    }
  }
}
