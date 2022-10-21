import 'package:flutter/material.dart';
import 'package:flutter_challenge_startaideia/app/modules/movie/presenter/controller/movie_person_controler.dart';
import 'package:flutter_challenge_startaideia/app/modules/movie/presenter/pages/movie_details_page/components/body_widget.dart';
import 'package:flutter_challenge_startaideia/app/modules/movie/presenter/pages/movie_details_page/components/header_widget.dart';
import 'package:provider/provider.dart';

class MovieDetailPage extends StatefulWidget {
  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  @override
  void initState() {
    super.initState();
    _initState();
  }

  void _initState() {
    Future.microtask(
      () => context.read<MoviePersonController>().fetchMoviePersonById(85),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MoviePersonController>(builder: (context, value, child) {
      return Scaffold(
        body: Column(
          children: [
            HeaderWidget(
              movie: value.movies,
            ),
            Expanded(
              child: Container(
                color: Colors.black,
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: BodyWidget(),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
