import 'package:flutter/material.dart';
import 'package:flutter_challenge_startaideia/app/modules/movie/presenter/pages/movie_details_page/movie_details_page.dart';

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
                  onPressed: () async {
                    await Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) => MovieDetailPage(),
                      ),
                    );
                  },
                  child: Text("Movie")),
            ),
          ],
        ),
      ),
    );
  }
}
