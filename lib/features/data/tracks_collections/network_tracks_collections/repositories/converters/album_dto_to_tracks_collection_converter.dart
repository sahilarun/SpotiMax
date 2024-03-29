import 'package:spotify/spotify.dart';
import 'package:spotimax/core/util/converters/result_converters/result_value_converter.dart';
import 'package:spotimax/core/util/failures/failures.dart';
import 'package:spotimax/core/util/result/result.dart';
import 'package:spotimax/features/domain/tracks/shared/entities/tracks_collection_type.dart';
import 'package:spotimax/features/domain/tracks/shared/entities/tracks_collection.dart';

class AlbumDtoToTracksCollectionConverter implements ResultValueConverter<TracksCollection, Album> {
  @override
  Result<ConverterFailure, TracksCollection> convert(Album album) {
    try {
      return Result.isSuccessful(TracksCollection(
        spotifyId: album.id!,
        type: TracksCollectionType.album,
        tracksCount: album.tracks!.length,
        name: album.name!,
        artists: album.artists?.map((a) => a.name ?? '').where((a) => a.isNotEmpty).toList(),
        smallImageUrl: album.images?.last.url,
        bigImageUrl: album.images?.first.url));
    } catch (e) {
      return const Result.notSuccessful(ConverterFailure());
    }
  }

  @override
  Result<ConverterFailure, Album> convertBack(TracksCollection value) {
    throw UnimplementedError();
  }
}