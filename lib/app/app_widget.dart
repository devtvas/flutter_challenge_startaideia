import 'package:flutter/material.dart';
import 'package:flutter_challenge_startaideia/app/app_pages.dart';
import 'package:flutter_challenge_startaideia/app/core/constants.dart';
import 'package:flutter_challenge_startaideia/app/core/theme.dart';
import 'package:get/get.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: Consts.kAppName,
      theme: kThemeApp,
      enableLog: true,
      // logWriterCallback: Logger.write,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      // locale: TranslationService.locale,
      // fallbackLocale: TranslationService.fallbackLocale,
      // translations: TranslationService(),
    );
  }
}
