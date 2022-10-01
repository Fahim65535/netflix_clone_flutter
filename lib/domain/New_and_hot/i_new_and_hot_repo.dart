import 'package:dartz/dartz.dart';
import 'package:netflix_app/domain/New_and_hot/model/new_and_hot_response.dart';
import 'package:netflix_app/domain/core/failures/main_failure.dart';

abstract class INewAndHotRepo {
  Future<Either<MainFailure, NewAndHotResponse>> getNewAndHotMovieData();
  Future<Either<MainFailure, NewAndHotResponse>> getNewAndHotTVData();
}
