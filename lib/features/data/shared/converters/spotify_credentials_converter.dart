import 'package:spotify/spotify.dart';
import 'package:spotimax/core/consts/spotify_client.dart';
import 'package:spotimax/core/util/converters/simple_converters/value_converter.dart';
import 'package:spotimax/features/domain/auth/shared/full_credentials.dart';

class SpotifyCredentialsConverter
    implements ValueConverter<SpotifyApiCredentials, FullCredentials> {
  @override
  SpotifyApiCredentials convert(FullCredentials fullCredentials) {
    return SpotifyApiCredentials(
      fullCredentials.clientId, 
      fullCredentials.clientSecret,
      refreshToken: fullCredentials.refreshToken,
      accessToken: fullCredentials.accessToken,
      expiration: fullCredentials.expiration,
      scopes: clientScopes);
  }

  @override
  FullCredentials convertBack(SpotifyApiCredentials spotifyApiCredentials) {
    return FullCredentials(
      clientId: spotifyApiCredentials.clientId ?? '', 
      clientSecret: spotifyApiCredentials.clientSecret ?? '', 
      refreshToken: spotifyApiCredentials.refreshToken,
      accessToken: spotifyApiCredentials.accessToken,
      expiration: spotifyApiCredentials.expiration);
  }
}
