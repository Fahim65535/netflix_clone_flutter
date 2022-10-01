import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_app/domain/core/failures/main_failure.dart';
import 'package:netflix_app/domain/downloads/i_downloads_repo.dart';
import 'package:netflix_app/domain/downloads/models/downloads.dart';
import 'package:netflix_app/domain/search/i_search_repo.dart';
import 'package:netflix_app/domain/search/model/search_response.dart';
part 'search_bloc.freezed.dart';
part 'search_event.dart';
part 'search_state.dart';

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final IDownloadsRepo _downloadsRepo;
  final ISearchRepo _searchRepo;

  SearchBloc(
    this._downloadsRepo,
    this._searchRepo,
  ) : super(SearchState.initial()) {
    //idle state
    on<Initialize>((event, emit) async {
      if (state.idleList.isNotEmpty) {
        emit(
          SearchState(
            idleList: state.idleList,
            isError: false,
            isLoading: false,
            searchResultList: [],
          ),
        );
        return;
      }
      emit(
        const SearchState(
          idleList: [],
          isError: false,
          isLoading: true,
          searchResultList: [],
        ),
      );
      //get trending

      final result = await _downloadsRepo.getDownloadsImages();

      final _state = result.fold(
        (MainFailure f) {
          return const SearchState(
            idleList: [],
            isError: true,
            isLoading: false,
            searchResultList: [],
          );
        },
        (List<Downloads> list) {
          return SearchState(
            idleList: list,
            isError: false,
            isLoading: false,
            searchResultList: [],
          );
        },
      );
      //show in UI
      emit(_state);
    });

    //search result state
    on<SearchMovie>((event, emit) async {
      //call search movie api
      // log('Searching for ${event.movieQuery}');
      emit(
        const SearchState(
          idleList: [],
          isError: false,
          isLoading: true,
          searchResultList: [],
        ),
      );
      final _result =
          await _searchRepo.searchMovies(movieQuery: event.movieQuery);
      final _statee = _result.fold(
        (MainFailure f) {
          return const SearchState(
            idleList: [],
            isError: true,
            isLoading: false,
            searchResultList: [],
          );
        },
        (SearchResponse s) {
          return SearchState(
            idleList: [],
            isError: false,
            isLoading: false,
            searchResultList: s.results,
          );
        },
      );
      //show in UI
      emit(_statee);
    });
  }
}
