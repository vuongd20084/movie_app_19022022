import 'package:dio/dio.dart';
import 'package:movie_app_19022022/model/genre_response.dart';
import 'package:movie_app_19022022/model/movie_response.dart';
import 'package:movie_app_19022022/model/person_response.dart';

class MovieRepository {
  final String apiKey = "555eea0ba8c9f62499a1906765c09dfe";
  static String mainUrl = "https://api.themoviedb.org/3";
  final Dio _dio = Dio();


  var getPopularUrl = '$mainUrl/movie/top_rated';
  var getMoviesUrl = '$mainUrl/discover/movie';
  var getPlayingUrl = '$mainUrl/movie/now_playing';
  var getGenresUrl = "$mainUrl/genre/movie/list";
  var getPersonsUrl = "$mainUrl/trending/person/week";

  Future<MovieResponse> getMovies() async {
    var params = {"api_key": apiKey, "language": "en-US", "page": 1};
    try {
      Response response = await _dio.get(getPopularUrl, queryParameters: params);
      return MovieResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("exception: $error, stacktrace: $stacktrace");
      return MovieResponse.withError("Error: $error, StackTrace: $stacktrace");
    }
  }

  Future<MovieResponse> getPlayingMovies() async {
    var params = {"api_key": apiKey, "language": "en-US", "page": 1};
    try {
      Response response = await _dio.get(getPlayingUrl, queryParameters: params);
      return MovieResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("exception: $error, stacktrace: $stacktrace");
      return MovieResponse.withError("Error: $error, StackTrace: $stacktrace");
    }
  }

  Future<GenreResponse> getGenres() async {
    var params = {"api_key": apiKey, "language": "en-US", "page": 1};
    try {
      Response response = await _dio.get(getGenresUrl, queryParameters: params);
      return GenreResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      return GenreResponse.withError("Error: $error, StackTrace: $stacktrace");
    }
  }

  Future<PersonResponse> getPersons() async {
    var params = {"api_key": apiKey};
    try {
      Response response =
      await _dio.get(getPersonsUrl, queryParameters: params);
      return PersonResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      return PersonResponse.withError("Error: $error, StackTrace: $stacktrace");
    }
  }

  Future<MovieResponse> getMovieByGenre(int id) async {
    var params = {
      "api_key": apiKey,
      "language": "en-US",
      "page": 1,
      "with_genres": id
    };
    try {
      Response response = await _dio.get(getMoviesUrl, queryParameters: params);
      return MovieResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      return MovieResponse.withError("Error: $error, StackTrace: $stacktrace");
    }
  }






  // Future<MovieResponse> getPopuparMovies(int page) async {
  //   var params = {"api_key": apiKey, "language": "en-US", "page": page};
  //   try {
  //     Response response =
  //     await _dio.get(getPopularMoviesApi, queryParameters: params);
  //     return MovieResponse.fromJson(response.data);
  //   } catch (error, stacktrace) {
  //     return MovieResponse.withError("Error: $error, StackTrace: $stacktrace");
  //   }
  // }
  //
  // Future<MovieResponse> getNowPlaying(int page) async {
  //   var params = {"api_key": apiKey, "language": "en-US", "page": page};
  //   try {
  //     Response response =
  //     await _dio.get(getNowPlayingMoviesApi, queryParameters: params);
  //     return MovieResponse.fromJson(response.data);
  //   } catch (error, stacktrace) {
  //     return MovieResponse.withError("Error: $error, StackTrace: $stacktrace");
  //   }
  // }
  //
  // Future<MovieResponse> getUpcomingMovies() async {
  //   var params = {"api_key": apiKey, "language": "en-US", "page": 1};
  //   try {
  //     Response response =
  //     await _dio.get(getUpComingApi, queryParameters: params);
  //     return MovieResponse.fromJson(response.data);
  //   } catch (error, stacktrace) {
  //     return MovieResponse.withError("Error: $error, StackTrace: $stacktrace");
  //   }
  // }
  //
  // Future<MovieResponse> getTopRatedMovies() async {
  //   var params = {"api_key": apiKey, "language": "en-US", "page": 1};
  //   try {
  //     Response response =
  //     await _dio.get(getTopRatedMoviesApi, queryParameters: params);
  //     return MovieResponse.fromJson(response.data);
  //   } catch (error, stacktrace) {
  //     return MovieResponse.withError("Error: $error, StackTrace: $stacktrace");
  //   }
  // }
  //
  //
  //
  //
  //
  //
  // Future<MovieDetailResponse> getMovieDetail(int id) async {
  //   var params = {"api_key": apiKey, "language": "en-US"};
  //   try {
  //     Response response =
  //     await _dio.get(movieUrl + "/$id", queryParameters: params);
  //     return MovieDetailResponse.fromJson(response.data);
  //   } catch (error, stacktrace) {
  //     return MovieDetailResponse.withError(
  //         "Error: $error, StackTrace: $stacktrace");
  //   }
  // }
  //
  // Future<VideoResponse> getMovieVideos(int id) async {
  //   var params = {"api_key": apiKey, "language": "en-US"};
  //   try {
  //     Response response = await _dio.get(movieUrl + "/$id" + "/videos",
  //         queryParameters: params);
  //     return VideoResponse.fromJson(response.data);
  //   } catch (error, stacktrace) {
  //     return VideoResponse.withError("Error: $error, StackTrace: $stacktrace");
  //   }
  // }
  //
  // Future<MovieResponse> getSimilarMovies(int id) async {
  //   var params = {"api_key": apiKey, "language": "en-US"};
  //   try {
  //     Response response = await _dio.get(movieUrl + "/$id" + "/similar",
  //         queryParameters: params);
  //     return MovieResponse.fromJson(response.data);
  //   } catch (error, stacktrace) {
  //     return MovieResponse.withError("Error: $error, StackTrace: $stacktrace");
  //   }
  // }
  //
  // Future<CastResponse> getCasts(int id) async {
  //   var params = {"api_key": apiKey, "language": "en-US"};
  //   try {
  //     Response response = await _dio.get(movieUrl + "/$id" + "/credits",
  //         queryParameters: params);
  //     return CastResponse.fromJson(response.data);
  //   } catch (error, stacktrace) {
  //     return CastResponse.withError("Error: $error, StackTrace: $stacktrace");
  //   }
  // }

}