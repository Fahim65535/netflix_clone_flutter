part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    required String stateId,
    required List<NewAndHot> releasedinPastYear,
    required List<NewAndHot> top10ShowsinUAE,
    required List<NewAndHot> trendingMovies,
    required List<NewAndHot> dramas,
    required List<NewAndHot> moviesForYou,
    required bool isLoading,
    required bool isError,
  }) = _Initial;

  factory HomeState.initial() => const HomeState(
        stateId: '0 ',
        releasedinPastYear: [],
        top10ShowsinUAE: [],
        trendingMovies: [],
        dramas: [],
        moviesForYou: [],
        isLoading: false,
        isError: false,
      );
}
