import 'package:spotify/spotify.dart' as dto;
import 'package:spotimax/core/util/converters/converter_with_parameter.dart';
import 'package:spotimax/features/domain/tracks/shared/entities/tracks_collection.dart';
import 'package:spotimax/features/domain/tracks/shared/entities/album.dart';
import 'package:spotimax/features/domain/tracks/shared/entities/track.dart' as entity;

class TrackDtoToTrackConverter implements ConverterWithParameter<entity.Track?, dto.Track, TracksCollection> {
  @override
  entity.Track? convert((dto.Track, TracksCollection) parameters) {
    final dtoTrack = parameters.$1;
    final parentCollection = parameters.$2;
    
    if (dtoTrack.id == null) {
      return null;
    }

    String? albumImageUrl;

    try {
      albumImageUrl = dtoTrack.album?.images?[1].url;
    } on RangeError {
      //rangeError
    }

    albumImageUrl ??= dtoTrack.album?.images?.firstOrNull?.url ?? '';

    return entity.Track(
        spotifyId: dtoTrack.id!, 
        duration: dtoTrack.duration,
        name: dtoTrack.name ?? 'no_name', 
        isLoaded: false, 
        parentCollection: parentCollection,
        artists: dtoTrack.artists?.map((a) => a.name!).toList(),
        album: Album(name: dtoTrack.album?.name, imageUrl: albumImageUrl));
  }

  @override
  dto.Track convertBack((entity.Track?, TracksCollection) value) {
    throw UnimplementedError();
  }
}
