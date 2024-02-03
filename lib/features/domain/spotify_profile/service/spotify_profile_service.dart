import 'package:spotimax/core/util/failures/failure.dart';
import 'package:spotimax/core/util/result/result.dart';
import 'package:spotimax/features/domain/spotify_profile/entities/spotify_profile.dart';

abstract class SpotifyProfileService {
    Future<Result<Failure, SpotifyProfile>> getSpotifyProfile();
}