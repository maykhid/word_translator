import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:textfield_search/textfield_search.dart';

import '../../../../core/util/fixture_reader.dart';
import '../../data/models/languages_model.dart';
import '../../domain/entities/languages.dart';
import '../bloc/from_to_bloc/from_to_bloc.dart';
import '../bloc/translator_bloc/translator_bloc.dart';
import '../widgets/widgets.dart';

class TranslatorPage extends StatefulWidget {
  const TranslatorPage({Key? key}) : super(key: key);

  @override
  State<TranslatorPage> createState() => _TranslatorPageState();
}

class _TranslatorPageState extends State<TranslatorPage> {
  final Widget svg =
      SvgPicture.asset('assets/images/logo.svg', semanticsLabel: 'Acme Logo');

  List<Languages>? languageList = [];
  String? from;
  String? to;

  Future<void> loadAsset() async {
    var s = await fixture('languages.json');
    setState(() {
      languageList = languagesFromJson(s);
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      loadAsset();
    });
    //  _textEditingController.addListener(() {
    //   BlocProvider.of<FromToBloc>(context)
    //       .add(GetFromLangEvent(_textEditingController.text, languageList));
    // });
    // _textEditingController2.addListener(() {
    //   BlocProvider.of<FromToBloc>(context)
    //       .add(GetFromLangEvent(_textEditingController2.text, languageList));
    // });
  }

  final TextEditingController _textEditingController = TextEditingController();
  final TextEditingController _textEditingController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // _textEditingController.text = 'English';
    // _textEditingController2.text = 'French';

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        // backgroundColor: Colors.grey.shade100,
        preferredSize: const Size.fromHeight(100),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.2,
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            border: Border(
              bottom: BorderSide(color: Colors.grey.shade400, width: 1),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(
                Icons.star_border,
                color: Colors.grey.shade700,
              ),
              svg,
              Icon(
                Icons.settings,
                color: Colors.grey.shade700,
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.grey.withOpacity(0.2),
          height: MediaQuery.of(context).size.height,
          width: double.maxFinite,
          child: Column(
            children: [
              // text-boxes-with-dropdown
              SizedBox(
                height: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // first lang box
                    SizedBox(
                      height: 30,
                      width: 170,
                      child: TextFieldSearch(
                        initialList:
                            languageList!.map((e) => e.name).toList(),
                        decoration: InputDecoration(
                          hintText: 'English',
                          contentPadding: const EdgeInsets.only(left: 10),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(90),
                            borderSide: const BorderSide(
                              color: Colors.purple,
                              width: 2.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(90),
                            borderSide: const BorderSide(
                              color: Colors.purple,
                              width: 2.0,
                            ),
                          ),
                        ),
                        label: '',
                        controller: _textEditingController,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                          side: const BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                        getSelectedValue: (item) {
                          BlocProvider.of<FromToBloc>(context)
                              .add(GetFromLangEvent(item, languageList));
                          debugPrint('i got item$item');
                        },
                      ),
                    ),

                    // icon arrows
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 4.0),
                      child: FaIcon(
                        FontAwesomeIcons.arrowRightArrowLeft,
                        size: 18,
                      ),
                    ),

                    // second lang box
                    SizedBox(
                      height: 30,
                      width: 170,
                      child: TextFieldSearch(
                        initialList:
                            languageList!.map((e) => e.name).toList(),
                        minStringLength: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                          side: const BorderSide(color: Colors.grey),
                        ),
                        decoration: InputDecoration(
                          hintText: 'French',
                          contentPadding: const EdgeInsets.only(left: 10),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(90),
                            borderSide: const BorderSide(
                              color: Colors.purple,
                              width: 2.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(90),
                            borderSide: const BorderSide(
                              color: Colors.purple,
                              width: 2.0,
                            ),
                          ),
                        ),
                        controller: _textEditingController2,
                        label: '',
                        getSelectedValue: (item) {
                          BlocProvider.of<FromToBloc>(context)
                              .add(GetToLangEvent(item, languageList));
                          debugPrint('i got item$item');
                        },
                      ),
                    ),
                  ],
                ),
              ),

              // text-box
              const SearchContainer(),

              const SizedBox(
                height: 20,
              ),

              BlocBuilder<TranslatorBloc, TranslatorState>(
                builder: (context, state) {
                  if (state is EmptyState) {
                    return Container();
                  } else if (state is LoadingState) {
                    return const SearchResultContainer(
                      prefferedWidget: Text(
                        'Translating...',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      ),
                    );
                  } else if (state is LoadedState) {
                    return SearchResultContainer(
                      prefferedWidget: Text(
                        state.result!.translations![0].text.toString(),
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    );
                  } else if (state is ErrorState) {
                    return SearchResultContainer(
                      prefferedWidget: Text(
                        state.message,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    );
                  } else {
                    return const SearchResultContainer(
                      prefferedWidget: Text(
                        'An error occured!',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
