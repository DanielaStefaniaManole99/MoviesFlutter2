import 'package:movies2/src/data/movie_api.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:movies2/src/actions/get_movies.dart';
import 'package:movies2/src/modules/app_state.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:rxdart/rxdart.dart';
import '../modules/movie.dart';

class AppEpic {
  AppEpic(this._movieApi);

  final MovieApi _movieApi;

  Epic<AppState> get epics {
    return combineEpics(<Epic<AppState>>[

      TypedEpic<AppState, GetMovies>(_getMovies),
    ]);
  }

    Stream<dynamic> _getMovies(Stream<GetMovies> actions, EpicStore<AppState> store){
      return actions
          .asyncMap((GetMovies actions) => _movieApi.getMovies(actions.page))
          .map<dynamic>((List<Movie> movies) => GetMoviesSuccessful(movies))
          .onErrorReturnWith((Object error, StackTrace stackTrace) => GetMoviesError(error));
    }
  }
