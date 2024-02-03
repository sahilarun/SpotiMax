import 'package:spotimax/core/util/failures/failure.dart';
import 'package:spotimax/core/util/result/result.dart';
import 'package:spotimax/features/domain/tracks/search_videos_by_track/entities/video.dart';
import 'package:spotimax/features/domain/tracks/shared/entities/track.dart';

abstract class SearchVideosByTrackRepository {
  Future<Result<Failure, Video?>> findVideoByTrack(Track track);
  Future<Result<Failure, List<Video>>> findVideosByTrack(Track track, int count);
  Future<Result<Failure, Video>> getVideoByUrl(String url);
}