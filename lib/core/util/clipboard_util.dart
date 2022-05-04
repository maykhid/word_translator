import 'package:clipboard/clipboard.dart';

class Clip {
  // copy
  static Future<void> copy(String? text, {Function? callBack}) async {
    return FlutterClipboard.copy(text!).then((_) {
      callBack!(text);
    });
  }

  // paste
  static Future<void> paste({required Function? callBack}) async {
    return FlutterClipboard.paste().then((_) {
      callBack!(_);
      // return _;
    });
  }
  // print('Pasted!')
}
