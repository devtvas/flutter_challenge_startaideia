import 'package:flutter/material.dart';
import 'package:flutter_challenge_startaideia/app/modules/movie/presenter/movie_details_page.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(child: Text("Home")),
            Center(
              child: ElevatedButton(
                  onPressed: () {
                    Get.to(() => MovieDetailPage());
                  },
                  child: Text("Movie")),
            ),
          ],
        ),
      ),
    );
  }
}
