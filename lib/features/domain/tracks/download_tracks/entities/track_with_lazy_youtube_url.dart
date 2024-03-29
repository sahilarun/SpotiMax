import 'package:spotimax/core/util/failures/failure.dart';
import 'package:spotimax/core/util/result/result.dart';
import 'package:spotimax/features/domain/tracks/shared/entities/track.dart';

class TrackWithLazyYoutubeUrl {
  TrackWithLazyYoutubeUrl({required this.track, required this.getYoutubeUrlFunction});

  final Track track;
  final Future<Result<Failure, String>> Function() getYoutubeUrlFunction;

  Future<Result<Failure, String>> getYoutubeUrl() async {
    if (track.youtubeUrl != null) {
      return Result.isSuccessful(track.youtubeUrl!);
    } else {
      final youtubeUrlResult = await getYoutubeUrlFunction.call();
      if (youtubeUrlResult.isSuccessful) {
        track.youtubeUrl = youtubeUrlResult.result;
      }
      return youtubeUrlResult;
    }
  }
}
