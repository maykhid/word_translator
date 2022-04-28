import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchResultContainer extends StatelessWidget {
  final Widget prefferedWidget;
  const SearchResultContainer({
    Key? key,
    required this.prefferedWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              child: FaIcon(
                FontAwesomeIcons.copy,
                color: Colors.black.withOpacity(0.3),
                size: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
