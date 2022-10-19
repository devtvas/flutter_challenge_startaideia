import 'package:dio/dio.dart';

const hom = 'localhost:8080/';
const prod = 'https://api.themoviedb.org/3';
const kBaseUrl = prod;
const kApiKey =
    'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4YTg3MGNhNDE5NWQ1Y2QyMDMyZTg5YTBiMGU5ZGVlOCIsInN1YiI6IjYxNDM1Mzk3NTZiOWY3MDA0NTAxMDQzZSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.ijDMRAueCWBT45PJ6_WDZ_Q6rZ7fKjl_uFE1T8KsLCg';

const kServerError = 'Failed to connect to the server. Try again later.';
final kDioOptions = BaseOptions(
  baseUrl: kBaseUrl,
  connectTimeout: 5000,
  receiveTimeout: 3000,
  contentType: 'application/json;charset=utf8',
  headers: {'Authorization': 'Bearer ' + kApiKey},
);
