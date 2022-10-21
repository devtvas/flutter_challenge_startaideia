import 'package:flutter/material.dart';
import 'package:flutter_challenge_startaideia/app/modules/movie/presenter/pages/movie_details_page/movie_details_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Stack(
      alignment: Alignment.center,
      children: [
        //image de fundo
        _buildImage(height),
        //button
        _buildButton(context)
      ],
    ));
  }

  Widget _buildImage(double height) {
    return Container(
      color: Colors.red,
      width: height,
      height: height,
      child: Image.asset('assets/images/profile.png', fit: BoxFit.fill),
    );
  }

  Widget _buildButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 0, top: 200, right: 0, bottom: 0),
      child: Container(
        // color: Colors.yellow,
        width: 100,
        height: 100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // const Center(child: Text("Home")),
            Center(
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) => MovieDetailPage(),
                      ),
                    );
                  },
                  child: const Text("Movies")),
            ),
          ],
        ),
      ),
    );
  }
}
