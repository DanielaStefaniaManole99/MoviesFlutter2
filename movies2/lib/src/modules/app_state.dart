import 'package:movies2/src/modules/movie.dart';
import 'package:meta/meta.dart';

@immutable
class AppState{
  const AppState({
    this.movies = const <Movie>[],
    this.isLoading = true,
    this.isListEmpty = true,
    this.pageNumber = 1,
  });

  final List<Movie> movies;
  final bool isLoading;
  final bool isListEmpty;
  final int pageNumber;

  AppState copyWith({
    List<Movie>? movies,
    bool? isLoading,
    bool? isListEmpty,
    int? pageNumber,
  }) {
    return AppState(
      movies: movies!=null? List<Movie>.unmodifiable(movies) : this.movies,
      isLoading: isLoading ?? this.isLoading,
      isListEmpty: isListEmpty ?? this.isListEmpty,
      pageNumber: pageNumber ?? this.pageNumber,
    );
  }
}