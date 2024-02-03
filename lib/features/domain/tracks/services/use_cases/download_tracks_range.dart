import 'package:spotimax/core/util/failures/failure.dart';
import 'package:spotimax/core/util/result/result.dart';
import 'package:spotimax/core/util/use_case/use_case.dart';
import 'package:spotimax/features/domain/tracks/services/entities/track_with_loading_observer.dart';
import 'package:spotimax/features/domain/tracks/services/services/download_tracks_service/download_tracks_service.dart';

class DownloadTracksRange implements UseCase<Failure, void, List<TrackWithLoadingObserver>> {
  DownloadTracksRange({required DownloadTracksService downloadTracksService}) : _downloadTracksService = downloadTracksService;

  final DownloadTracksService _downloadTracksService;

  @override
  Future<Result<Failure, void>> call(List<TrackWithLoadingObserver> tracks) async {
    return _downloadTracksService.downloadTracksRange(tracks);
  }
}