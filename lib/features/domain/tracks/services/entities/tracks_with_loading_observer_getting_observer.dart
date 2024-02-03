import 'package:spotimax/core/util/failures/failure.dart';
import 'package:spotimax/core/util/result/result.dart';
import 'package:spotimax/features/domain/tracks/network_tracks/entities/tracks_getting_ended_status.dart';
import 'package:spotimax/features/domain/tracks/services/entities/track_with_loading_observer.dart';

class TracksWithLoadingObserverGettingObserver {
    TracksWithLoadingObserverGettingObserver({
    required this.onEnded,
    required this.onPartGot,
  });


  Stream<Result<Failure, TracksGettingEndedStatus>> onEnded;
  Stream<List<TrackWithLoadingObserver>> onPartGot;
}
