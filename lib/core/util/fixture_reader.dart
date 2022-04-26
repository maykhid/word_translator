import 'dart:io';

import 'package:flutter/services.dart';

Future<String> fixture(String name) {
  return rootBundle.loadString('assets/json/$name');
}

String fixtureTest(String name) =>
    File('test/fixtures/$name').readAsStringSync();
