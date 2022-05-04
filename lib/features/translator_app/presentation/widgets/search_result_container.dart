import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:word_translator/core/util/clipboard_util.dart';
import 'package:word_translator/features/translator_app/presentation/bloc/translator_bloc/translator_bloc.dart';

class SearchResultContainer extends StatelessWidget {
  final Widget prefferedWidget;
  const SearchResultContainer({
    Key? key,
    required this.prefferedWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.watch<TranslatorBloc>().state;
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
                child: prefferedWidget,
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
                  if (state is LoadedState) {
                    Clip.copy(state.result!.translations![0].text,
                        callBack: (String result) {});
                  }
                  // Todo: refactor this snackbar code
                  else {
                    Fluttertoast.showToast(
                        msg: "This is Center Short Toast",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  }
                },
                icon: FaIcon(
                  FontAwesomeIcons.copy,
                  color: state is LoadedState
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
}
