

import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkInfo{
  Future<bool> get isConnected ;
  //get refer to getter 
}

class NetworkInfoImpl implements NetworkInfo{

  final InternetConnectionChecker connectionChecker;

  NetworkInfoImpl(this.connectionChecker);
  @override
  // TODO: implement isConnected
  Future<bool> get isConnected => connectionChecker.hasConnection;

}