import 'package:spotimax/core/util/failures/failure.dart';
import 'package:spotimax/core/util/result/result.dart';
import 'package:spotimax/core/util/use_case/use_case.dart';

import 'package:spotimax/features/domain/spotify_profile/entities/spotify_profile.dart';
import 'package:spotimax/features/domain/spotify_profile/service/spotify_profile_service.dart';

class GetSpotifyProfile implements UseCase<Failure, SpotifyProfile, void> {
  GetSpotifyProfile({required SpotifyProfileService spotifyProfileService})
      : _spotifyProfileService = spotifyProfileService;

  final SpotifyProfileService _spotifyProfileService;

  @override
  Future<Result<Failure, SpotifyProfile>> call(void params) async {
    return _spotifyProfileService.getSpotifyProfile();
  }
}
