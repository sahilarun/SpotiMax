import 'package:spotify/spotify.dart';
import 'package:spotimax/core/util/failures/failure.dart';
import 'package:spotimax/core/util/result/result.dart';
import 'package:spotimax/core/util/util_methods.dart';
import 'package:spotimax/features/data/shared/spotify_api_request.dart';

class SpotifyProfileDataSource {
  Future<Result<Failure, User>> getSpotifyProfile(SpotifyApiRequest spotifyApiRequest) async {
    final profileResult = handleSpotifyClientExceptions(() async {
      final spotifyClient = await SpotifyApi.asyncFromCredentials(spotifyApiRequest.spotifyApiCredentials,
          onCredentialsRefreshed: spotifyApiRequest.onCredentialsRefreshed);
      final profile = await spotifyClient.me.get();
      return Result.isSuccessful(profile);
    });

    return profileResult;
  }
}
