import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import 'package:netflix_app/domain/New_and_hot/i_new_and_hot_repo.dart';
import 'package:netflix_app/domain/New_and_hot/model/new_and_hot_response.dart';
import 'package:netflix_app/domain/core/failures/main_failure.dart';

part 'new_and_hot_bloc.freezed.dart';
part 'new_and_hot_event.dart';
part 'new_and_hot_state.dart';

@injectable
class NewAndHotBloc extends Bloc<NewAndHotEvent, NewAndHotState> {
  final INewAndHotRepo newAndHotRepo;
  NewAndHotBloc(this.newAndHotRepo) : super(NewAndHotState.initial()) {
    //
    //
    //get new and hot movie data
    on<LoadDataComingSoon>(
      (event, emit) async {
        //
        //
        //send loading stuff to ui
        emit(
          const NewAndHotState(
            comingSoonList: [],
            everyoneisWatching: [],
            isLoading: true,
            isError: false,
          ),
        );
        //get data from remote
        final result = await newAndHotRepo.getNewAndHotMovieData();

        //data to state
        final newState = result.fold(
          (MainFailure f) {
            return const NewAndHotState(
              comingSoonList: [],
              everyoneisWatching: [],
              isLoading: false,
              isError: true,
            );
          },
          (NewAndHotResponse s) {
            return NewAndHotState(
              comingSoonList: s.results,
              everyoneisWatching: state.everyoneisWatching,
              isLoading: false,
              isError: false,
            );
          },
        );

        //emiting to ui
        emit(newState);
      },
    );

    //getting new and hot tv data
    on<LoadEverybodyIsWatching>(
      (event, emit) async {
        //
        //
        //send loading stuff to ui
        emit(
          const NewAndHotState(
            comingSoonList: [],
            everyoneisWatching: [],
            isLoading: true,
            isError: false,
          ),
        );
        //get data from remote
        final result = await newAndHotRepo.getNewAndHotTVData();

        //data to state
        final newState = result.fold(
          (MainFailure f) {
            return const NewAndHotState(
              comingSoonList: [],
              everyoneisWatching: [],
              isLoading: false,
              isError: true,
            );
          },
          (NewAndHotResponse s) {
            return NewAndHotState(
              comingSoonList: state.comingSoonList,
              everyoneisWatching: s.results,
              isLoading: false,
              isError: false,
            );
          },
        );

        //emiting to ui
        emit(newState);
      },
    );
  }
}
