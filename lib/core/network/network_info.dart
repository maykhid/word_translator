import 'package:data_connection_checker/data_connection_checker.dart';

abstract class NetworkInfo {
  Future<bool>? get isConnected;
}

// Creating the Implementation of the NetworkInfo in the same file because both are general requirements 
// in a device. Therefore should be located in the core folder.
class NetworkInfoImpl implements NetworkInfo {
  final DataConnectionChecker connectionChecker;

  NetworkInfoImpl(this.connectionChecker);

  @override
  Future<bool>? get isConnected => connectionChecker.hasConnection;
}