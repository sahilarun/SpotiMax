import 'package:spotimax/core/util/failures/failure.dart';
import 'package:spotimax/core/util/result/result.dart';
import 'package:spotimax/core/util/use_case/use_case.dart';
import 'package:spotimax/features/domain/tracks/observe_tracks_loading/entities/repository/loading_tracks_collections_observer.dart';
import 'package:spotimax/features/domain/tracks/observe_tracks_loading/repository/observe_tracks_loading_repository.dart';

class GetLoadingTracksCollectionsObserver implements UseCase<Failure, LoadingTracksCollectionsObserver, void> {
  final ObserveTracksLoadingRepository _observeTracksLoading;

  GetLoadingTracksCollectionsObserver({required ObserveTracksLoadingRepository repository})
      : _observeTracksLoading = repository;

  @override
  Future<Result<Failure, LoadingTracksCollectionsObserver>> call(void params) async {
    return Result.isSuccessful(await _observeTracksLoading.getTracksCollectionsLoadingObserver());
  }
}
