import 'package:aloroupia/core/manager/cache/cache_helper.dart';
import 'package:aloroupia/core/manager/services/service_locator.dart';

void onBoardingVisited() {
  getIt<CacheHelper>().saveData(key: "isOnboardingVisited", value: true);
}
