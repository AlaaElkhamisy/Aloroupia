import 'package:aloroupia/core/manager/cache/cache_helper.dart';
import 'package:aloroupia/core/manager/services/service_locator.dart';

liked() {
  getIt<CacheHelper>().saveData(key: "isLiked", value: true);
}
