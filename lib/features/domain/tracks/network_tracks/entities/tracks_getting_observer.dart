import 'package:spotimax/core/util/failures/failure.dart';
import 'package:spotimax/core/util/result/result.dart';
import 'package:spotimax/features/domain/tracks/network_tracks/entities/tracks_getting_ended_status.dart';
import 'package:spotimax/features/domain/tracks/shared/entities/track.dart';

class TracksGettingObserver {
  Function(Result<Failure, TracksGettingEndedStatus>)? onEnded;
  Function(Iterable<Track?>)? onPartGot;
}
