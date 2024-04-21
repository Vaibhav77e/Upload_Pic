
import 'package:get_it/get_it.dart';
import 'package:upload_pic/services/user_auth.dart';  

final getIt = GetIt.instance;

Future<void> setUpServiceLoactor()async{
  getIt.registerLazySingleton(() => UserAuthentication());
}