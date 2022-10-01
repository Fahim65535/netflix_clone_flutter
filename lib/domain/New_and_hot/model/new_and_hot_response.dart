import 'package:json_annotation/json_annotation.dart';
part 'new_and_hot_response.g.dart';

@JsonSerializable()
class NewAndHotResponse {
  @JsonKey(name: 'page')
  int? page;

  @JsonKey(name: 'results')
  List<NewAndHot> results;

  NewAndHotResponse({this.page, this.results = const []});

  factory NewAndHotResponse.fromJson(Map<String, dynamic> json) {
    return _$NewAndHotResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$NewAndHotResponseToJson(this);
}

@JsonSerializable()
class NewAndHot {
  @JsonKey(name: 'backdrop_path')
  String? backdropPath;

  @JsonKey(name: 'id')
  int? id;

  @JsonKey(name: 'original_language')
  String? originalLanguage;

  @JsonKey(name: 'original_title')
  String? originalTitle;

  //only for tv series
  @JsonKey(name: 'original_name')
  String? originalName;

  @JsonKey(name: 'overview')
  String? overview;

  @JsonKey(name: 'poster_path')
  String? posterPath;

  @JsonKey(name: 'release_date')
  String? releaseDate;

  @JsonKey(name: 'title')
  String? title;

  NewAndHot({
    this.backdropPath,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.originalName,
    this.overview,
    this.posterPath,
    this.releaseDate,
    this.title,
  });

  factory NewAndHot.fromJson(Map<String, dynamic> json) {
    return _$NewAndHotFromJson(json);
  }

  Map<String, dynamic> toJson() => _$NewAndHotToJson(this);
}
