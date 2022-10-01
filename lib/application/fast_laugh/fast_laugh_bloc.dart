import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_app/domain/core/failures/main_failure.dart';
import 'package:netflix_app/domain/downloads/i_downloads_repo.dart';
import 'package:netflix_app/domain/downloads/models/downloads.dart';
part 'fast_laugh_event.dart';
part 'fast_laugh_state.dart';
part 'fast_laugh_bloc.freezed.dart';

final testvideoUrl = [
  'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4',
  'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4',
  'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4',
  'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/TearsOfSteel.mp4',
  'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/WeAreGoingOnBullrun.mp4',
];

ValueNotifier<Set<int>> likedVideosIdsNotifier = ValueNotifier({});
ValueNotifier<Set<int>> addToListNotifier = ValueNotifier({});

@injectable
class FastLaughBloc extends Bloc<FastLaughEvent, FastLaughState> {
  FastLaughBloc(
    IDownloadsRepo downloadsRepo,
  ) : super(FastLaughState.initial()) {
    //
    //
    on<InitializeFL>(
      (event, emit) async {
        //sending loading stuff to ui
        emit(
          FastLaughState(
            videoList: [],
            isLoading: true,
            isError: false,
          ),
        );

        //get trending movies
        final _result = await downloadsRepo.getDownloadsImages();
        final _state = _result.fold(
          (failure) => FastLaughState(
            videoList: [],
            isLoading: false,
            isError: true,
          ),
          (response) => FastLaughState(
            videoList: response,
            isLoading: false,
            isError: false,
          ),
        );

        //emitting to ui
        emit(_state);
      },
    );

    on<LikedVideo>((event, emit) async {
      likedVideosIdsNotifier.value.add(event.id);
      likedVideosIdsNotifier.notifyListeners();
    });

    on<UnlikedVideo>((event, emit) async {
      likedVideosIdsNotifier.value.remove(event.id);
      likedVideosIdsNotifier.notifyListeners();
    });

    on<AddToList>((event, emit) async {
      addToListNotifier.value.add(event.id);
      addToListNotifier.notifyListeners();
    });

    on<RemoveFromList>((event, emit) async {
      addToListNotifier.value.remove(event.id);
      addToListNotifier.notifyListeners();
    });
  }
}
