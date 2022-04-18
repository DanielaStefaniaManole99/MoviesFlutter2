import '../modules/movie.dart';

class GetMovies {
  GetMovies(this.page);

  final int page;
}

class GetMoviesSuccessful {
  GetMoviesSuccessful(this.movies);

  List<Movie> movies;
}

class GetMoviesError {
  GetMoviesError(this.error);

  final Object error;
}