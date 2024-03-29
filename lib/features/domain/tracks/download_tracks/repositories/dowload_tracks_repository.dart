// ignore_for_file: void_checks

import 'package:spotimax/core/util/failures/failure.dart';
import 'package:spotimax/core/util/result/result.dart';
import 'package:spotimax/features/domain/tracks/download_tracks/entities/loading_track_observer.dart';
import 'package:spotimax/features/domain/tracks/download_tracks/entities/track_with_lazy_youtube_url.dart';
import 'package:spotimax/features/domain/tracks/shared/entities/track.dart';

abstract class DownloadTracksRepository {
  Future<Result<Failure, LoadingTrackObserver>> dowloadTrack(TrackWithLazyYoutubeUrl lazyTrack, String savePath);
  Result<Failure, void> cancelTrackLoading(Track track, String savePat);
  Future<Result<Failure, LoadingTrackObserver?>> getLoadingTrackObserver(Track track, String savePath);
}
