import 'package:freezed_annotation/freezed_annotation.dart';
part 'main_failure.freezed.dart';

@freezed
class MainFailure with _$MainFailure {
  const factory MainFailure.clientFailure() = _ClientFailure;
  const factory MainFailure.serverFailure() = _serverFailure;
}

//cmd to generate freeze

//flutter pub run build_runner watch --delete-conflicting-outputs
