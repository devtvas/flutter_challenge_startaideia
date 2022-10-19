import 'package:flutter_challenge_startaideia/app/app_routes.dart';
import 'package:flutter_challenge_startaideia/app/modules/home/presenter/home_page.dart';
import 'package:flutter_challenge_startaideia/app/modules/movie/presenter/movie_details_page.dart';
import 'package:get/get.dart';

class AppPages {
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(name: Routes.HOME, page: () => const HomePage()),
    GetPage(name: Routes.MOVIE, page: () => const MovieDetailPage()),
    // GetPage(name: Routes.HOME, page: () => const HomePage()),
  ];
}
