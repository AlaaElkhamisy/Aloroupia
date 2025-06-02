import 'package:aloroupia/core/manager/cache/cache_helper.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void setup_Service_Locator() {
  getIt.registerSingleton(CacheHelper());
  //getIt.registerSingleton<AuthCubit>(AuthCubit());
}
