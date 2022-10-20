import 'package:flutter/material.dart';
import 'package:flutter_challenge_startaideia/app/modules/home/domain/home_model.dart';
import 'package:flutter_challenge_startaideia/app/modules/movie/domain/movie_model.dart';
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
  void initState() {
    super.initState();
    _initState();
  }

  void _initState() {
    var result = context.read<MovieDetailController>();
    result.fetchMovieByIdSimilar(3);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildBoxOne(context),
        _buildBoxTwo(context),
        _buildBoxThree(context),
      ],
    );
  }

  Widget _buildBoxOne(BuildContext context) {
    return Consumer<MovieDetailController>(
      builder: (context, value, child) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Expanded(
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
              child: IconButton(
                onPressed: () {
                  print('IconButton');
                  value.like();
                  value.fetchMovieByIdSimilar(3);
                  setState(() {});
                },
                icon: value.isLike == true
                    ? Icon(Icons.favorite)
                    : Icon(Icons.favorite_border),
              ),
            ),
          ),
        ],
      ),
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
                    value.movieDetail?.voteCount == null
                        ? '0k Likes'
                        : '${value.movieDetail?.voteCount}k Likes',
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
                children: [
                  const Align(
                    alignment: Alignment.centerRight,
                    child: Icon(Icons.supervised_user_circle_outlined),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    value.movieDetail?.popularity == null
                        ? '0 Watched'
                        : '${value.movieDetail?.popularity} Watched',
                    style: const TextStyle(
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
    return Consumer<MovieDetailController>(
      builder: (context, data, child) => Container(
        // color: Colors.yellow,
        height: MediaQuery.of(context).size.height * 0.36,
        child: data.movies.isEmpty //se retorno null(renderiza a mensagem)
            ? const Center(
                child: Text(
                  'Lista vazia no momento!',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )
            : ListView.builder(
                itemCount: data.movies.length,
                itemBuilder: (ctx, i) {
                  return MovieCard(
                    movie: data.movies[i],
                    dateFormat: data.dateFormat,
                  );
                },
                scrollDirection: Axis.vertical,
              ),
      ),
    );
  }
}
