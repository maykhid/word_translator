import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:textfield_search/textfield_search.dart';
import 'package:word_translator/dependency_injector.dart';

import '../../../../core/util/fixture_reader.dart';
import '../../data/models/languages_model.dart';
import '../../domain/entities/languages.dart';
import '../bloc/translator_bloc/translator_bloc.dart';
import '../widgets/widgets.dart';

class TranslatorPage extends StatefulWidget {
  const TranslatorPage({Key? key}) : super(key: key);

  @override
  State<TranslatorPage> createState() => _TranslatorPageState();
}

class _TranslatorPageState extends State<TranslatorPage> {
  // final String assetName = 'assets/logo.svg';
  final Widget svg =
      SvgPicture.asset('assets/images/logo.svg', semanticsLabel: 'Acme Logo');

  List<Languages>? transList = [];
  String? from;
  String? to;

  Future<void> loadAsset() async {
    var s = await fixture('languages.json');
    transList = languagesFromJson(s);
  }

  @override
  void initState() {
    loadAsset();
    super.initState();
  }

  final TextEditingController _textEditingController = TextEditingController();
  final TextEditingController _textEditingController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: BlocProvider(
          create: (context) => di<TranslatorBloc>(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // header
              Container(
                // color: Colors.red,
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

              // body
              Container(
                color: Colors.grey.withOpacity(0.2),
                height: MediaQuery.of(context).size.height * 0.8,
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
                                  transList!.map((e) => e.name).toList(),
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
                                var list =
                                    transList!.map((e) => e.name).toList();
                                var listOfLangCodes =
                                    transList!.map((e) => e.code).toList();
                                print(list.indexOf(item));
                                print(listOfLangCodes[list.indexOf(item)]);
                                from = listOfLangCodes[list.indexOf(item)]
                                    .toString();
                                // if(item.name ==)
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
                                  transList!.map((e) => e.name).toList(),
                              minStringLength: 10,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                                side: const BorderSide(color: Colors.grey),
                              ),
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
                              controller: _textEditingController2,
                              label: '',
                              getSelectedValue: (item) {
                                var list =
                                    transList!.map((e) => e.name).toList();
                                var listOfLangCodes =
                                    transList!.map((e) => e.code).toList();
                                print(list.indexOf(item));
                                print(listOfLangCodes[list.indexOf(item)]);
                                to = listOfLangCodes[list.indexOf(item)]
                                    .toString();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),

                    // text-box
                    SearchContainer(from: from, to: to),

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
            ],
          ),
        ),
      ),
    );
  }
}
