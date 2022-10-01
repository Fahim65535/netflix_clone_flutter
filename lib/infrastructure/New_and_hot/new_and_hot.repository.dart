import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_app/domain/New_and_hot/i_new_and_hot_repo.dart';
import 'package:netflix_app/domain/New_and_hot/model/new_and_hot_response.dart';
import 'package:netflix_app/domain/core/api_end_points.dart';
import 'package:netflix_app/domain/core/failures/main_failure.dart';

@LazySingleton(as: INewAndHotRepo)
class NewAandHotRepository implements INewAndHotRepo {
  @override
  Future<Either<MainFailure, NewAndHotResponse>> getNewAndHotMovieData() async {
    try {
      final Response response = await Dio(BaseOptions()).get(
        ApiEndPoints.newAndhotMovie,
      );
      //log(response.data.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        //
        final result = NewAndHotResponse.fromJson(response.data);

        return Right(result);
        //
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      // log(e.toString());
      return const Left(MainFailure.clientFailure());
    }
  }

  @override
  Future<Either<MainFailure, NewAndHotResponse>> getNewAndHotTVData() async {
    try {
      final Response response = await Dio(BaseOptions()).get(
        ApiEndPoints.newAndhotTV,
      );
      //log(response.data.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        //
        final result = NewAndHotResponse.fromJson(response.data);

        return Right(result);
        //
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      // log(e.toString());
      return const Left(MainFailure.clientFailure());
    }
  }
}
