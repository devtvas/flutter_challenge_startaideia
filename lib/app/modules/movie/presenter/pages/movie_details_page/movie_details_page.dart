import 'package:flutter/material.dart';
import 'package:flutter_challenge_startaideia/app/modules/movie/presenter/controller/movie_details_controler.dart';
import 'package:flutter_challenge_startaideia/app/modules/movie/presenter/pages/movie_details_page/components/body_label_widget.dart';
import 'package:flutter_challenge_startaideia/app/modules/movie/presenter/pages/movie_details_page/components/header_label_widget.dart';
import 'package:provider/provider.dart';

class MovieDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MovieDetailController _toDoNotifier =
        Provider.of<MovieDetailController>(context, listen: false);
    _toDoNotifier.fetchMovieById(3);
    return Consumer<MovieDetailController>(builder: (context, value, child) {
      return Scaffold(
        body: Column(
          children: [
            const HeaderLabelWidget(
              image: 'assets/images/jonny2.png',
            ),
            Expanded(
              child: Container(
                color: Colors.black,
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: BodyLabelWidget(),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
