import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_app/domain/core/failures/main_failure.dart';
import 'package:netflix_app/domain/downloads/i_downloads_repo.dart';
import 'package:netflix_app/domain/downloads/models/downloads.dart';
part 'downloads_bloc.freezed.dart';
part 'downloads_event.dart';
part 'downloads_state.dart';

@injectable
class DownloadsBloc extends Bloc<DownloadsEvent, DownloadsState> {
  final IDownloadsRepo _downloadsRepo;

  DownloadsBloc(this._downloadsRepo) : super(DownloadsState.initial()) {
    //
    on<_GetDownloadsImages>(
      (event, emit) async {
        //
        emit(
          state.copyWith(
            isLoading: true,
            downloadsFailureorSuccessOption: const None(),
          ),
        );
        final Either<MainFailure, List<Downloads>> downloadsOptions =
            await _downloadsRepo.getDownloadsImages();
        // log(downloadsOptions.toString());
        //
        emit(
          downloadsOptions.fold(
            (failureL) => state.copyWith(
                isLoading: false,
                downloadsFailureorSuccessOption: Some(Left(failureL))),
            (successR) => state.copyWith(
                isLoading: false,
                downloads: successR,
                downloadsFailureorSuccessOption: Some(Right(successR))),
          ),
        );
      },
    );
  }
}
