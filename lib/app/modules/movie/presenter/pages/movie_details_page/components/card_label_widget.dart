import 'package:flutter/material.dart';
import 'package:flutter_challenge_startaideia/app/modules/movie/domain/movie_model.dart';
import 'package:intl/intl.dart';

class MovieCard extends StatelessWidget {
  final MovieModel movie;
  final DateFormat dateFormat;

  MovieCard({Key? key, required this.movie, required this.dateFormat})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = 140;
    return Card(
      color: Colors.transparent,
      elevation: 0,
      child: Row(
        children: <Widget>[
          Container(
            height: height,
            child: Image.network(
                'https://image.tmdb.org/t/p/w500/${movie.posterPath}'),
          ),
          Expanded(
            // Add from this line
            child: Container(
              // color: Colors.red,
              height: height,
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Icon(Icons.check_circle),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        // 'Ip Man 4: The Finale',
                        movie.title,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                      child: Text('${dateFormat.format(movie.releaseDate)}'))
                ],
              ),
            ),
          ) // To this line
        ],
      ),
    );
  }
}
