import 'package:flutter_challenge_startaideia/app/modules/home/data/home_repository.dart';
import 'package:get/get.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeRepository());
  }
}
