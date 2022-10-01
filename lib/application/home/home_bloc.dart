import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import 'package:netflix_app/domain/New_and_hot/i_new_and_hot_repo.dart';
import 'package:netflix_app/domain/New_and_hot/model/new_and_hot_response.dart';
import 'package:netflix_app/domain/core/failures/main_failure.dart';

part 'home_bloc.freezed.dart';
part 'home_event.dart';
part 'home_state.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final INewAndHotRepo homerepo;
  HomeBloc(this.homerepo) : super(HomeState.initial()) {
    //

    //getting data
    on<GetHomeData>(
      (event, emit) async {
        //sending loading stuff
        emit(
          state.copyWith(
            isLoading: true,
            isError: false,
          ),
        );

        //getting data from remote
        final movieResult = await homerepo.getNewAndHotMovieData();
        final tvResult = await homerepo.getNewAndHotTVData();

        //data to state1
        final state1 = movieResult.fold(
          (MainFailure f) {
            return HomeState(
              stateId: DateTime.now().millisecondsSinceEpoch.toString(),
              releasedinPastYear: [],
              top10ShowsinUAE: [],
              trendingMovies: [],
              dramas: [],
              moviesForYou: [],
              isLoading: false,
              isError: true,
            );
          },
          (NewAndHotResponse response) {
            final pastYear = response.results;
            final trendingmovies = response.results;
            final dramas = response.results;
            final movies4u = response.results;
            pastYear.shuffle();
            trendingmovies.shuffle();
            dramas.shuffle();
            movies4u.shuffle();
            return HomeState(
              stateId: DateTime.now().millisecondsSinceEpoch.toString(),
              releasedinPastYear: pastYear,
              top10ShowsinUAE: state.top10ShowsinUAE,
              trendingMovies: trendingmovies,
              dramas: dramas,
              moviesForYou: movies4u,
              isLoading: false,
              isError: false,
            );
          },
        );

        emit(state1);

        //data to state2
        final state2 = tvResult.fold(
          (MainFailure f) {
            return HomeState(
              stateId: DateTime.now().millisecondsSinceEpoch.toString(),
              releasedinPastYear: [],
              top10ShowsinUAE: [],
              trendingMovies: [],
              dramas: [],
              moviesForYou: [],
              isLoading: false,
              isError: true,
            );
          },
          (NewAndHotResponse response) {
            return HomeState(
              stateId: DateTime.now().millisecondsSinceEpoch.toString(),
              releasedinPastYear: state.releasedinPastYear,
              top10ShowsinUAE: response.results,
              trendingMovies: state.trendingMovies,
              dramas: state.dramas,
              moviesForYou: state.moviesForYou,
              isLoading: false,
              isError: false,
            );
          },
        );

        emit(state2);
      },
    );
  }
}
