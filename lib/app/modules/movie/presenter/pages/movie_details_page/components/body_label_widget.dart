import 'package:flutter/material.dart';
import 'package:flutter_challenge_startaideia/app/modules/movie/presenter/controller/movie_details_controler.dart';
import 'package:flutter_challenge_startaideia/app/modules/movie/presenter/pages/movie_details_page/components/card_label_widget.dart';
import 'package:provider/provider.dart';

class BodyLabelWidget extends StatefulWidget {
  const BodyLabelWidget({Key? key}) : super(key: key);

  @override
  State<BodyLabelWidget> createState() => _BodyLabelWidgetState();
}

class _BodyLabelWidgetState extends State<BodyLabelWidget> {
  @override
  Widget build(BuildContext context) {
    MovieDetailController _movieDetailController =
        Provider.of<MovieDetailController>(context, listen: false);
    return Column(
      children: [
        _buildBoxOne(context),
        _buildBoxTwo(context),
        _buildBoxThree(context),
      ],
    );
  }

  Widget _buildBoxOne(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Expanded(
          child: Text(
            'The Very Best Of Johnny Depp',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: Icon(Icons.favorite),
          ),
        ),
      ],
    );
  }

  Widget _buildBoxTwo(BuildContext context) {
    return Consumer<MovieDetailController>(
      builder: (context, value, child) => Padding(
        padding: const EdgeInsets.only(left: 0, top: 10, right: 0, bottom: 10),
        child: Row(
          children: [
            Container(
              // color: Colors.red,
              child: Row(
                children: [
                  const Align(
                    alignment: Alignment.centerRight,
                    child: Icon(Icons.favorite),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    // '1.2k Likes',
                    '${value.movieDetail!.voteCount}',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 30),
            Container(
              // color: Colors.red,
              child: Row(
                children: const [
                  Align(
                    alignment: Alignment.centerRight,
                    child: Icon(Icons.circle_outlined),
                  ),
                  SizedBox(width: 10),
                  Text(
                    '3 of 10 Watched',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBoxThree(BuildContext context) {
    return Container(
      // color: Colors.yellow,
      height: MediaQuery.of(context).size.height * 0.36,
      child: ListView.builder(
        itemCount: 8,
        // itemCount: movies.length,
        itemBuilder: (context, index) => MovieCard(
            // movie: movies[index],
            ),
        scrollDirection: Axis.vertical,
      ),
    );
  }
}
