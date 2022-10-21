import 'package:flutter/material.dart';
import 'package:flutter_challenge_startaideia/app/modules/movie/domain/movie_model.dart';
import 'package:intl/intl.dart';

class MovieCardItem extends StatelessWidget {
  final MovieModel movie;
  final DateFormat dateFormat;

  MovieCardItem({Key? key, required this.movie, required this.dateFormat})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.6;
    double height = MediaQuery.of(context).size.height * 0.2;

    return Card(
      color: Colors.transparent,
      elevation: 0,
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              height: height,
              child: Image.network(
                  // 'https://image.tmdb.org/t/p/original${movie.posterPath}'),
                  'https://image.tmdb.org/t/p/w500${movie.posterPath}'),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              // color: Colors.red,
              height: height,
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //icone
                  Row(
                    children: [
                      Container(
                        // color: Colors.red,
                        width: width,
                        child: const Align(
                          alignment: Alignment.centerRight,
                          child: Icon(Icons.check_circle),
                        ),
                      ),
                    ],
                  ),
                  //title
                  Container(
                    // color: Colors.red,
                    width: width,
                    child: Text(
                      // 'Ip Man 4: The Finale',
                      movie.title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.clip,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  //ano
                  Container(
                    // color: Colors.red,
                    width: width,
                    child: Text('${dateFormat.format(movie.releaseDate)}'),
                  )
                ],
              ),
            ),
          ) // To this line
        ],
      ),
    );
  }
}
