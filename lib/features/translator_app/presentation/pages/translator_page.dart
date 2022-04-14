import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TranslatorPage extends StatefulWidget {
  const TranslatorPage({Key? key}) : super(key: key);

  @override
  State<TranslatorPage> createState() => _TranslatorPageState();
}

class _TranslatorPageState extends State<TranslatorPage> {
  // final String assetName = 'assets/logo.svg';
  final Widget svg =
      SvgPicture.asset('assets/images/logo.svg', semanticsLabel: 'Acme Logo');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
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
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'English',
                              contentPadding: const EdgeInsets.only(left: 10),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(90),
                                borderSide: const BorderSide(
                                    color: Colors.purple, width: 2.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(90),
                                borderSide: const BorderSide(
                                    color: Colors.purple, width: 2.0),
                              ),
                            ),
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
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'English',
                              contentPadding: const EdgeInsets.only(left: 10),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(90),
                                borderSide: const BorderSide(
                                    color: Colors.purple, width: 2.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(90),
                                borderSide: const BorderSide(
                                    color: Colors.purple, width: 2.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // text-box
                  Container(
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
                                  width:
                                      MediaQuery.of(context).size.width * 0.70,
                                  // color: Colors.black,
                                  child: const TextField(
                                    maxLines: 100,
                                    decoration: InputDecoration(
                                      hintText: 'Enter text here',
                                      hintStyle: TextStyle(color: Colors.grey),
                                      contentPadding: EdgeInsets.only(left: 15),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            // paste from keyboard
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              height: 35,
                              width: MediaQuery.of(context).size.width * 0.48,
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  FaIcon(
                                    FontAwesomeIcons.keyboard,
                                    color: Colors.black.withOpacity(0.3),
                                    size: 15,
                                  ),
                                  Text(
                                    'Paste from clipboard',
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.5),
                                        fontSize: 16),
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
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  Container(
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
                              child: const Text(
                                'Translating...',
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 16),
                              ),
                            ),
                          ),
                        ),

                        Container(
                          // padding: const EdgeInsets.symmetric(horizontal: 10),
                          height: 35,
                          width: MediaQuery.of(context).size.width,
                          decoration: ShapeDecoration(
                            color: Colors.grey.withOpacity(0.1),
                            shape: CircleBorder(),
                          ),
                          child: Center(
                            child: FaIcon(
                              FontAwesomeIcons.copy,
                              color: Colors.black.withOpacity(0.3),
                              size: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
