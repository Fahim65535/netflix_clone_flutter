part of 'fast_laugh_bloc.dart';

@freezed
class FastLaughEvent with _$FastLaughEvent {
  const factory FastLaughEvent.initialize() = InitializeFL;
  const factory FastLaughEvent.likedVideo({required int id}) = LikedVideo;
  const factory FastLaughEvent.unlikedVideo({required int id}) = UnlikedVideo;
  const factory FastLaughEvent.addToList({required int id}) = AddToList;
  const factory FastLaughEvent.removeFromList({required int id}) =
      RemoveFromList;
}
