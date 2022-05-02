import 'package:clipboard/clipboard.dart';

class Clip {
  // copy
  static Future<void> copy(String? text, {Function? callBack}) async {
    return FlutterClipboard.copy(text!).then((_) {
      callBack!(text);
    });
  }

  // paste
  static Future<String> paste(String? text, {Function? callBack}) async {
    return FlutterClipboard.paste().then((_) {
      callBack!();
      return _;
    });
  }
  // print('Pasted!')
}
