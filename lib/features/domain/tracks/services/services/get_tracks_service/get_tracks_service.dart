import 'package:spotimax/core/util/failures/failure.dart';
import 'package:spotimax/core/util/result/result.dart';
import 'package:spotimax/features/domain/tracks/shared/entities/tracks_collection.dart';
import 'package:spotimax/features/domain/tracks/services/entities/tracks_with_loading_observer_getting_observer.dart';

abstract class GetTracksService {
  Future<Result<Failure, TracksWithLoadingObserverGettingObserver>> getTracksWithLoadingObserversFromTracksColleciton(
      {required TracksCollection tracksCollection, required int offset});
}