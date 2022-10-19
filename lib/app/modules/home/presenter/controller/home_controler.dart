import 'package:flutter_challenge_startaideia/app/modules/home/data/home_repository.dart';
import 'package:flutter_challenge_startaideia/app/modules/home/domain/home_model.dart';

class HomeControler {
  final _repository = HomeRepository();

  late MovieModel model;
  bool loading = true;

  Future fetchAllMovies({int page = 1}) async {
    final result = await _repository.fetchAllMovies(page);
    result.fold(
      (movie) {
        if (model == null) {
          model = movie;
        } else {
          model = movie.page;
        }
      },
    );

    return result;
  }
}
