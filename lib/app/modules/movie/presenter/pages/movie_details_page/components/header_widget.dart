import 'package:flutter/material.dart';
import 'package:flutter_challenge_startaideia/app/modules/movie/domain/movie_person_model.dart';

class HeaderWidget extends StatelessWidget {
  final MoviePersonModel movie;
  const HeaderWidget({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Stack(
          fit: StackFit.expand,
          children: [
            movie.profile_path.isEmpty
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                // : Image.asset('assets/images/profile.png', fit: BoxFit.cover),
                : Image.network(
                    'https://image.tmdb.org/t/p/w500${movie.profile_path}',
                    fit: BoxFit.cover),
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.red,
                  gradient: LinearGradient(
                    begin: FractionalOffset.topCenter,
                    end: FractionalOffset.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0.5),
                      Colors.black,
                    ],
                    stops: [0.5, 1.0],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
