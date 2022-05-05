import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../core/util/clipboard_util.dart';
import '../bloc/from_to_bloc/from_to_bloc.dart';
import '../bloc/translator_bloc/translator_bloc.dart';
import '../notifiers/notifiers.dart';

class SearchContainer extends StatefulWidget {
  const SearchContainer({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchContainer> createState() => _SearchContainerState();
}

class _SearchContainerState extends State<SearchContainer> {
  late String inputStr;
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final state = context.watch<FromToBloc>().state;
    return Container(
      padding: const EdgeInsets.all(22),
      height: 200,
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // text field
              Scrollbar(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  reverse: true,
                  child: SizedBox(
                    height: 110,
                    width: MediaQuery.of(context).size.width * 0.70,
                    // color: Colors.black,
                    child: TextField(
                      maxLines: 100,
                      controller: _textEditingController,
                      decoration: const InputDecoration(
                        hintText: 'Enter text here',
                        hintStyle: TextStyle(color: Colors.grey),
                        contentPadding: EdgeInsets.only(left: 15),
                        border: InputBorder.none,
                      ),
                      onChanged: (val) {
                        inputStr = val;
                        dispatchGetTranslation(state);
                      },
                      onSubmitted: (_) {
                        dispatchGetTranslation(state);
                      },
                    ),
                  ),
                ),
              ),

              // paste from keyboard
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                height: 35,
                width: MediaQuery.of(context).size.width * 0.48,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FaIcon(
                      FontAwesomeIcons.keyboard,
                      color: Colors.black.withOpacity(0.3),
                      size: 15,
                    ),
                    InkWell(
                      onTap: () async {
                        await Clip.paste(
                            callBack: (value) =>
                                _textEditingController.text += value);
                      },
                      child: Text(
                        'Paste from clipboard',
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.5), fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          // mic
          SizedBox(
            child: IconButton(
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              icon: Icon(
                Icons.mic_none_outlined,
                color: Colors.grey.withOpacity(0.5),
                size: 30,
              ),
              onPressed: null,
            ),
          ),
        ],
      ),
    );
  }

  void dispatchGetTranslation(FromToState state) {
    if (state.from == null || state.to == null) {
      Notifiers.showSnackbar(
        context: context,
        text: 'Check that your preffered language(s) has been selected.',
      );
    } else {
      BlocProvider.of<TranslatorBloc>(context)
          .add(GetTranslatedTextEvent(inputStr, state.from, state.to));
    }
  }
}
