import 'package:spotimax/core/util/failures/failure.dart';
import 'package:spotimax/core/util/result/result.dart';
import 'package:spotimax/core/util/use_case/use_case.dart';
import 'package:spotimax/features/domain/tracks/services/services/download_tracks_service/download_tracks_service.dart';
import 'package:spotimax/features/domain/tracks/shared/entities/track.dart';

class CancelTrackLoading implements UseCase<Failure, void, Track> {
  CancelTrackLoading({required DownloadTracksService dowloadTracksService})
      : _dowloadTracksService = dowloadTracksService;

  final DownloadTracksService _dowloadTracksService;

  @override
  Future<Result<Failure, void>> call(Track track) async {
    return _dowloadTracksService.cancelTrackLoading(track);
  }
}
