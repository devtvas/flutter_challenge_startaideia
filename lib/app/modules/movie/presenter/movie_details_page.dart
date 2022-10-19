import 'package:flutter/material.dart';
import 'package:flutter_challenge_startaideia/app/core/widgets/centered_message.dart';
import 'package:flutter_challenge_startaideia/app/core/widgets/centered_progress.dart';
import 'package:flutter_challenge_startaideia/app/modules/movie/presenter/controller/movie_details_controler.dart';

class MovieDetailPage extends StatefulWidget {
  const MovieDetailPage({Key? key}) : super(key: key);

  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  final _controller = MovieDetailController();

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  _initialize() async {
    setState(() {
      _controller.loading = true;
    });

    await _controller.fetchMovieById(3);

    setState(() {
      _controller.loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildMovieDetail(),
    );
  }

  _buildAppBar() {
    return AppBar(
      title: Text(_controller.movieDetail?.title ?? ''),
    );
  }

  _buildMovieDetail() {
    if (_controller.loading) {
      return CenteredProgress();
    }

    if (_controller.movieError != null) {
      return CenteredMessage(message: _controller.movieError!.message);
    }

    return ListView(
      children: [
        _buildCover(context),
        // _buildStatus(),
        // _buildOverview(),
      ],
    );
  }

  // _buildCover() {
  //   return Image.network(
  //     'https://image.tmdb.org/t/p/w500${_controller.movieDetail!.backdropPath}',
  //   );
  // }

  Widget _buildCover(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 500.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  'https://image.tmdb.org/t/p/w500${_controller.movieDetail!.posterPath}'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          height: 500.0,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.black, Colors.transparent],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
        ),
        Positioned(
          bottom: 110.0,
          child: SizedBox(
            width: 250.0,
            // child: Image.asset(featuredContent.titleImageUrl as String),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 40.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // VerticalIconButton(
              //   icon: Icons.add,
              //   title: 'List',
              //   onTap: () => print('My List'),
              // ),
              // _PlayButton(),
              // VerticalIconButton(
              //   icon: Icons.info_outline,
              //   title: 'Info',
              //   onTap: () => print('Info'),
              // ),
            ],
          ),
        ),
      ],
    );
  }
}
