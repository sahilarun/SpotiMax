import 'package:spotimax/core/util/failures/failure.dart';
import 'package:spotimax/core/util/result/result.dart';
import 'package:spotimax/core/util/use_case/use_case.dart';
import 'package:spotimax/features/domain/tracks/search_videos_by_track/entities/video.dart';
import 'package:spotimax/features/domain/tracks/search_videos_by_track/repositories/search_videos_by_track_repository.dart';
import 'package:spotimax/features/domain/tracks/shared/entities/track.dart';

class Find10VideosByTrack implements UseCase<Failure, List<Video>, Track> {
  Find10VideosByTrack({required SearchVideosByTrackRepository searchVideosByTrackRepository})
      : _searchVideosByTrackRepository = searchVideosByTrackRepository;

  final SearchVideosByTrackRepository _searchVideosByTrackRepository;

  @override
  Future<Result<Failure, List<Video>>> call(Track track) {
    return _searchVideosByTrackRepository.findVideosByTrack(track, 10);
  }
}
