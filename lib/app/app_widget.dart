import 'package:flutter/material.dart';
import 'package:flutter_challenge_startaideia/app/core/constants.dart';
import 'package:flutter_challenge_startaideia/app/core/theme.dart';
import 'package:flutter_challenge_startaideia/app/modules/home/presenter/home_page.dart';
import 'package:flutter_challenge_startaideia/app/modules/movie/data/movie_repository.dart';
import 'package:flutter_challenge_startaideia/app/modules/movie/presenter/controller/movie_details_controler.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('pt_BR', null);
    return MultiProvider(
      providers: [
        Provider<MovieRepository>(create: (_) => MovieRepository()),
        ChangeNotifierProvider<MovieDetailController>(
            create: (context) => MovieDetailController(context.read()))
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: Consts.kAppName,
        theme: kThemeApp,
        home: const HomePage(),
      ),
    );
  }
}
