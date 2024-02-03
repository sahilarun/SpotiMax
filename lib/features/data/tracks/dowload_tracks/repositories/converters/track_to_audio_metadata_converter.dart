import 'package:spotimax/core/util/converters/simple_converters/value_converter.dart';
import 'package:spotimax/core/util/util_methods.dart';
import 'package:spotimax/features/data/tracks/dowload_tracks/models/metadata/album_metadata.dart';
import 'package:spotimax/features/data/tracks/dowload_tracks/models/metadata/audio_metadata.dart';
import 'package:spotimax/features/domain/tracks/shared/entities/track.dart';

class TrackToAudioMetadataConverter implements ValueConverter<AudioMetadata, Track> {
  @override
  AudioMetadata convert(Track track) {
    return AudioMetadata(
        name: formatStringToFileFormat(track.name)!,
        artists: track.artists,
        album: AlbumMetadata(
            name: formatStringToFileFormat(track.album?.name), 
            imageUrl: track.album?.imageUrl, 
            artists: track.parentCollection.artists));
  }

  @override
  Track convertBack(AudioMetadata value) {
    throw UnimplementedError();
  }
}
