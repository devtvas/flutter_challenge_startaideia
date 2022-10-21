import 'package:flutter/material.dart';
import 'package:flutter_challenge_startaideia/app/modules/home/domain/home_model.dart';
import 'package:flutter_challenge_startaideia/app/modules/movie/domain/movie_model.dart';
import 'package:flutter_challenge_startaideia/app/modules/movie/presenter/controller/movie_list_controler.dart';
import 'package:flutter_challenge_startaideia/app/modules/movie/presenter/controller/movie_person_controler.dart';
import 'package:flutter_challenge_startaideia/app/modules/movie/presenter/pages/movie_details_page/components/card_item_widget.dart';
import 'package:provider/provider.dart';

class BodyWidget extends StatefulWidget {
  const BodyWidget({Key? key}) : super(key: key);

  @override
  State<BodyWidget> createState() => _BodyWidgetState();
}

class _BodyWidgetState extends State<BodyWidget> {
  @override
  void initState() {
    super.initState();
    _initState();
  }

  void _initState() {
    var list = context.read<MovieListController>();
    list.fetchMovieByIdSimilar(85);
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
    String name = 'Artist';
    return Consumer<MoviePersonController>(
      builder: (context, value, child) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              value.movies.name.isEmpty
                  ? 'The Very Best Of ${name}'
                  : 'The Very Best Of ${value.movies.name}',
              style: const TextStyle(
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
                  value.like();
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
    return Consumer<MoviePersonController>(
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
                    value.movies.popularity.isNaN
                        ? '0 Likes'
                        : '${value.movies.popularity} Likes',
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
                    value.movies.popularity.isNaN
                        ? '0 Watched'
                        : '${value.movies.popularity} Watched',
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
    return Consumer<MovieListController>(
      builder: (context, data, child) => Container(
        // color: Colors.yellow,
        height: MediaQuery.of(context).size.height * 0.36,
        child: data.listMovies.isEmpty //se retorno null(renderiza a mensagem)
            ? const Center(
                child: Text(
                  'Lista vazia no momento!',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )
            : ListView.builder(
                itemCount: data.listMovies.length,
                itemBuilder: (ctx, i) {
                  return MovieCardItem(
                    movie: data.listMovies[i],
                    dateFormat: data.dateFormat,
                  );
                },
                scrollDirection: Axis.vertical,
              ),
      ),
    );
  }
}
