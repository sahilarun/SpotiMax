import 'package:spotify/spotify.dart';
import 'package:spotimax/core/util/converters/result_converters/result_value_converter.dart';
import 'package:spotimax/core/util/failures/failures.dart';
import 'package:spotimax/core/util/result/result.dart';
import 'package:spotimax/features/domain/tracks/shared/entities/tracks_collection_type.dart';
import 'package:spotimax/features/domain/tracks/shared/entities/tracks_collection.dart';

class TrackDtoToTracksCollectionConverter implements ResultValueConverter<TracksCollection, Track> {
  @override
  Result<ConverterFailure, TracksCollection> convert(Track track) {
    try {
      return Result.isSuccessful(TracksCollection(
        spotifyId: track.id!,
        type: TracksCollectionType.track,
        name: track.name!,
        tracksCount: 1,
        artists: track.artists?.map((a) => a.name ?? '').where((an) => an.isNotEmpty).toList(),
        smallImageUrl: track.album?.images?.last.url,
        bigImageUrl: track.album?.images?.first.url));
    } catch (e) {
      return const Result.notSuccessful(ConverterFailure());
    }
  }

  @override
  Result<ConverterFailure, Track> convertBack(TracksCollection value) {
    throw UnimplementedError();
  }

}