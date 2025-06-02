import 'package:aloroupia/core/router/app_router.dart';
import 'package:aloroupia/generated/l10n.dart';
import 'package:flutter/cupertino.dart';

List<String> categoryList(BuildContext context) {
  return <String>[
    S.of(context).classic,
    S.of(context).newClassic,
    S.of(context).modern,
  ];
}

List<String> categories = [
  AppRouter.classicView,
  AppRouter.newClassicView,
  AppRouter.modernView,
];
