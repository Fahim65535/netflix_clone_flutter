part of 'new_and_hot_bloc.dart';

@freezed
class NewAndHotState with _$NewAndHotState {
  const factory NewAndHotState({
    required List<NewAndHot> comingSoonList,
    required List<NewAndHot> everyoneisWatching,
    required bool isLoading,
    required bool isError,
  }) = _Initial;

  factory NewAndHotState.initial() => const NewAndHotState(
        comingSoonList: [],
        everyoneisWatching: [],
        isError: false,
        isLoading: false,
      );
}
