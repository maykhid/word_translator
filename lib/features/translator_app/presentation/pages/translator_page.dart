import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
      body: SizedBox.expand(
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
                        SizedBox(
                          height: 50,
                          width: 150,
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'English',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide:
                                      const BorderSide(color: Colors.purple)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // text-box
                  Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
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
