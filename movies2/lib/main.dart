import 'package:movies2/src/actions/get_movies.dart';
import 'package:movies2/src/data/movie_api.dart';
import 'package:movies2/src/modules/app_state.dart';
import 'package:movies2/src/epics/app_epic.dart';
import 'package:movies2/src/reducer/reducer.dart';
import 'package:redux/redux.dart';
import 'package:http/http.dart';
import 'package:redux_epics/redux_epics.dart';

void main() {

  final Client client = Client();
  final MovieApi movieApi = MovieApi(client);
  final AppEpic epic = AppEpic(movieApi);

  final Store<AppState> store = Store<AppState>(
      reducer,
      initialState: const AppState(),
      middleware: <Middleware<AppState>>[
        EpicMiddleware<AppState>(epic.epics),
      ],
  );

  store.dispatch(GetMovies(1));

}