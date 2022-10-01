// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'home_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HomeEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getHomeData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? getHomeData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getHomeData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetHomeData value) getHomeData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GetHomeData value)? getHomeData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetHomeData value)? getHomeData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeEventCopyWith<$Res> {
  factory $HomeEventCopyWith(HomeEvent value, $Res Function(HomeEvent) then) =
      _$HomeEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$HomeEventCopyWithImpl<$Res> implements $HomeEventCopyWith<$Res> {
  _$HomeEventCopyWithImpl(this._value, this._then);

  final HomeEvent _value;
  // ignore: unused_field
  final $Res Function(HomeEvent) _then;
}

/// @nodoc
abstract class _$$GetHomeDataCopyWith<$Res> {
  factory _$$GetHomeDataCopyWith(
          _$GetHomeData value, $Res Function(_$GetHomeData) then) =
      __$$GetHomeDataCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetHomeDataCopyWithImpl<$Res> extends _$HomeEventCopyWithImpl<$Res>
    implements _$$GetHomeDataCopyWith<$Res> {
  __$$GetHomeDataCopyWithImpl(
      _$GetHomeData _value, $Res Function(_$GetHomeData) _then)
      : super(_value, (v) => _then(v as _$GetHomeData));

  @override
  _$GetHomeData get _value => super._value as _$GetHomeData;
}

/// @nodoc

class _$GetHomeData implements GetHomeData {
  const _$GetHomeData();

  @override
  String toString() {
    return 'HomeEvent.getHomeData()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetHomeData);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getHomeData,
  }) {
    return getHomeData();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? getHomeData,
  }) {
    return getHomeData?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getHomeData,
    required TResult orElse(),
  }) {
    if (getHomeData != null) {
      return getHomeData();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetHomeData value) getHomeData,
  }) {
    return getHomeData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GetHomeData value)? getHomeData,
  }) {
    return getHomeData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetHomeData value)? getHomeData,
    required TResult orElse(),
  }) {
    if (getHomeData != null) {
      return getHomeData(this);
    }
    return orElse();
  }
}

abstract class GetHomeData implements HomeEvent {
  const factory GetHomeData() = _$GetHomeData;
}

/// @nodoc
mixin _$HomeState {
  String get stateId => throw _privateConstructorUsedError;
  List<NewAndHot> get releasedinPastYear => throw _privateConstructorUsedError;
  List<NewAndHot> get top10ShowsinUAE => throw _privateConstructorUsedError;
  List<NewAndHot> get trendingMovies => throw _privateConstructorUsedError;
  List<NewAndHot> get dramas => throw _privateConstructorUsedError;
  List<NewAndHot> get moviesForYou => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isError => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res>;
  $Res call(
      {String stateId,
      List<NewAndHot> releasedinPastYear,
      List<NewAndHot> top10ShowsinUAE,
      List<NewAndHot> trendingMovies,
      List<NewAndHot> dramas,
      List<NewAndHot> moviesForYou,
      bool isLoading,
      bool isError});
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res> implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  final HomeState _value;
  // ignore: unused_field
  final $Res Function(HomeState) _then;

  @override
  $Res call({
    Object? stateId = freezed,
    Object? releasedinPastYear = freezed,
    Object? top10ShowsinUAE = freezed,
    Object? trendingMovies = freezed,
    Object? dramas = freezed,
    Object? moviesForYou = freezed,
    Object? isLoading = freezed,
    Object? isError = freezed,
  }) {
    return _then(_value.copyWith(
      stateId: stateId == freezed
          ? _value.stateId
          : stateId // ignore: cast_nullable_to_non_nullable
              as String,
      releasedinPastYear: releasedinPastYear == freezed
          ? _value.releasedinPastYear
          : releasedinPastYear // ignore: cast_nullable_to_non_nullable
              as List<NewAndHot>,
      top10ShowsinUAE: top10ShowsinUAE == freezed
          ? _value.top10ShowsinUAE
          : top10ShowsinUAE // ignore: cast_nullable_to_non_nullable
              as List<NewAndHot>,
      trendingMovies: trendingMovies == freezed
          ? _value.trendingMovies
          : trendingMovies // ignore: cast_nullable_to_non_nullable
              as List<NewAndHot>,
      dramas: dramas == freezed
          ? _value.dramas
          : dramas // ignore: cast_nullable_to_non_nullable
              as List<NewAndHot>,
      moviesForYou: moviesForYou == freezed
          ? _value.moviesForYou
          : moviesForYou // ignore: cast_nullable_to_non_nullable
              as List<NewAndHot>,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: isError == freezed
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
  @override
  $Res call(
      {String stateId,
      List<NewAndHot> releasedinPastYear,
      List<NewAndHot> top10ShowsinUAE,
      List<NewAndHot> trendingMovies,
      List<NewAndHot> dramas,
      List<NewAndHot> moviesForYou,
      bool isLoading,
      bool isError});
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res> extends _$HomeStateCopyWithImpl<$Res>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, (v) => _then(v as _$_Initial));

  @override
  _$_Initial get _value => super._value as _$_Initial;

  @override
  $Res call({
    Object? stateId = freezed,
    Object? releasedinPastYear = freezed,
    Object? top10ShowsinUAE = freezed,
    Object? trendingMovies = freezed,
    Object? dramas = freezed,
    Object? moviesForYou = freezed,
    Object? isLoading = freezed,
    Object? isError = freezed,
  }) {
    return _then(_$_Initial(
      stateId: stateId == freezed
          ? _value.stateId
          : stateId // ignore: cast_nullable_to_non_nullable
              as String,
      releasedinPastYear: releasedinPastYear == freezed
          ? _value._releasedinPastYear
          : releasedinPastYear // ignore: cast_nullable_to_non_nullable
              as List<NewAndHot>,
      top10ShowsinUAE: top10ShowsinUAE == freezed
          ? _value._top10ShowsinUAE
          : top10ShowsinUAE // ignore: cast_nullable_to_non_nullable
              as List<NewAndHot>,
      trendingMovies: trendingMovies == freezed
          ? _value._trendingMovies
          : trendingMovies // ignore: cast_nullable_to_non_nullable
              as List<NewAndHot>,
      dramas: dramas == freezed
          ? _value._dramas
          : dramas // ignore: cast_nullable_to_non_nullable
              as List<NewAndHot>,
      moviesForYou: moviesForYou == freezed
          ? _value._moviesForYou
          : moviesForYou // ignore: cast_nullable_to_non_nullable
              as List<NewAndHot>,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: isError == freezed
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial(
      {required this.stateId,
      required final List<NewAndHot> releasedinPastYear,
      required final List<NewAndHot> top10ShowsinUAE,
      required final List<NewAndHot> trendingMovies,
      required final List<NewAndHot> dramas,
      required final List<NewAndHot> moviesForYou,
      required this.isLoading,
      required this.isError})
      : _releasedinPastYear = releasedinPastYear,
        _top10ShowsinUAE = top10ShowsinUAE,
        _trendingMovies = trendingMovies,
        _dramas = dramas,
        _moviesForYou = moviesForYou;

  @override
  final String stateId;
  final List<NewAndHot> _releasedinPastYear;
  @override
  List<NewAndHot> get releasedinPastYear {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_releasedinPastYear);
  }

  final List<NewAndHot> _top10ShowsinUAE;
  @override
  List<NewAndHot> get top10ShowsinUAE {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_top10ShowsinUAE);
  }

  final List<NewAndHot> _trendingMovies;
  @override
  List<NewAndHot> get trendingMovies {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_trendingMovies);
  }

  final List<NewAndHot> _dramas;
  @override
  List<NewAndHot> get dramas {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dramas);
  }

  final List<NewAndHot> _moviesForYou;
  @override
  List<NewAndHot> get moviesForYou {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_moviesForYou);
  }

  @override
  final bool isLoading;
  @override
  final bool isError;

  @override
  String toString() {
    return 'HomeState(stateId: $stateId, releasedinPastYear: $releasedinPastYear, top10ShowsinUAE: $top10ShowsinUAE, trendingMovies: $trendingMovies, dramas: $dramas, moviesForYou: $moviesForYou, isLoading: $isLoading, isError: $isError)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Initial &&
            const DeepCollectionEquality().equals(other.stateId, stateId) &&
            const DeepCollectionEquality()
                .equals(other._releasedinPastYear, _releasedinPastYear) &&
            const DeepCollectionEquality()
                .equals(other._top10ShowsinUAE, _top10ShowsinUAE) &&
            const DeepCollectionEquality()
                .equals(other._trendingMovies, _trendingMovies) &&
            const DeepCollectionEquality().equals(other._dramas, _dramas) &&
            const DeepCollectionEquality()
                .equals(other._moviesForYou, _moviesForYou) &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality().equals(other.isError, isError));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(stateId),
      const DeepCollectionEquality().hash(_releasedinPastYear),
      const DeepCollectionEquality().hash(_top10ShowsinUAE),
      const DeepCollectionEquality().hash(_trendingMovies),
      const DeepCollectionEquality().hash(_dramas),
      const DeepCollectionEquality().hash(_moviesForYou),
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(isError));

  @JsonKey(ignore: true)
  @override
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      __$$_InitialCopyWithImpl<_$_Initial>(this, _$identity);
}

abstract class _Initial implements HomeState {
  const factory _Initial(
      {required final String stateId,
      required final List<NewAndHot> releasedinPastYear,
      required final List<NewAndHot> top10ShowsinUAE,
      required final List<NewAndHot> trendingMovies,
      required final List<NewAndHot> dramas,
      required final List<NewAndHot> moviesForYou,
      required final bool isLoading,
      required final bool isError}) = _$_Initial;

  @override
  String get stateId;
  @override
  List<NewAndHot> get releasedinPastYear;
  @override
  List<NewAndHot> get top10ShowsinUAE;
  @override
  List<NewAndHot> get trendingMovies;
  @override
  List<NewAndHot> get dramas;
  @override
  List<NewAndHot> get moviesForYou;
  @override
  bool get isLoading;
  @override
  bool get isError;
  @override
  @JsonKey(ignore: true)
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}
