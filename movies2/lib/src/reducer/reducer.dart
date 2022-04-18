import 'package:movies2/src/actions/get_movies.dart';
import 'package:movies2/src/modules/app_state.dart';
import 'package:redux/redux.dart';
import 'package:movies2/src/modules/movie.dart';

Reducer<AppState> reducer = combineReducers<AppState>(<Reducer<AppState>>[
  TypedReducer<AppState, GetMoviesSuccessful>(_getMoviesSuccessful),
  ]);

AppState _getMoviesSuccessful(AppState state, GetMoviesSuccessful action) {
  return state.copyWith(movies: <Movie>[...state.movies, ...action.movies]);
}


