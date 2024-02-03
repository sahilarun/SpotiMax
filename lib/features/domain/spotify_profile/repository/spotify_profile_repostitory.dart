import 'package:spotimax/core/util/failures/failure.dart';
import 'package:spotimax/core/util/result/result.dart';
import 'package:spotimax/features/domain/shared/spotify_repository_request.dart';
import 'package:spotimax/features/domain/spotify_profile/entities/spotify_profile.dart';

abstract class SpotifyProfileRepository {
  Future<Result<Failure, SpotifyProfile>> getSpotifyProfile(SpotifyRepositoryRequest spotifyClientRequest);
}