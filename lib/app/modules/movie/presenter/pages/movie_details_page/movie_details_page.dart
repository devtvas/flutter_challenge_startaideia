import 'package:flutter/material.dart';
import 'package:flutter_challenge_startaideia/app/modules/movie/presenter/controller/movie_details_controler.dart';
import 'package:flutter_challenge_startaideia/app/modules/movie/presenter/pages/movie_details_page/components/body_label_widget.dart';
import 'package:flutter_challenge_startaideia/app/modules/movie/presenter/pages/movie_details_page/components/header_label_widget.dart';
import 'package:provider/provider.dart';

class MovieDetailPage extends StatefulWidget {
  const MovieDetailPage({Key? key}) : super(key: key);

  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MovieDetailController>(
      builder: (context, controller, child) => Scaffold(
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
      ),
    );
  }
}
