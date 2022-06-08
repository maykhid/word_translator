import 'package:clipboard/clipboard.dart';

class Clip {
  // copy
  static Future<void> copy(String? text, {Function? callBack, Function? onErrorCallback}) async {
    return FlutterClipboard.copy(text!).then((_) 
      => callBack!(text),
    ).onError((error, stackTrace) => onErrorCallback!());
  }

  // paste
  static Future<void> paste({Function? callback, Function? onErrorCallback}) async {
    return FlutterClipboard.paste().then((_) 
      => callback!(_),
      // return _;
    ).onError((error, stackTrace) => onErrorCallback!());
  }
  // print('Pasted!')
}
