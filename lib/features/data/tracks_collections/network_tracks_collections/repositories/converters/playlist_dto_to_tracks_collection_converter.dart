import 'package:spotify/spotify.dart';
import 'package:spotimax/core/util/converters/result_converters/result_value_converter.dart';
import 'package:spotimax/core/util/failures/failures.dart';
import 'package:spotimax/core/util/result/result.dart';
import 'package:spotimax/features/domain/tracks/shared/entities/tracks_collection_type.dart';
import 'package:spotimax/features/domain/tracks/shared/entities/tracks_collection.dart';

class PlaylistDtoToTracksCollectionConverter implements ResultValueConverter<TracksCollection, Playlist> {
  @override
  Result<ConverterFailure, TracksCollection> convert(Playlist playlist) {
    try {
      return Result.isSuccessful(TracksCollection(
        spotifyId: playlist.id!,
        type: TracksCollectionType.playlist,
        tracksCount: playlist.tracks!.total,
        artists: List<String>.filled(1, playlist.owner?.displayName ?? ''),
        name: playlist.name!,
        smallImageUrl: playlist.images?.last.url,
        bigImageUrl: playlist.images?.first.url));
    } catch (e) {
      return const Result.notSuccessful(ConverterFailure());
    }
  }

  @override
  Result<ConverterFailure, Playlist> convertBack(TracksCollection value) {
    throw UnimplementedError();
  }
}
