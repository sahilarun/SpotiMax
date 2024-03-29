import 'dart:io';
import 'dart:typed_data';

import 'package:metadata_god/metadata_god.dart';
import 'package:spotimax/core/util/failures/failure.dart';
import 'package:spotimax/core/util/failures/failures.dart';
import 'package:spotimax/core/util/result/result.dart';
import 'package:spotimax/features/data/tracks/dowload_tracks/data_sources/tools/audio_metadata_editor/audio_metadata_editor.dart';
import 'package:spotimax/features/data/tracks/dowload_tracks/models/metadata/audio_metadata.dart';
import 'package:http/http.dart' as http;

class AudioMetadataEditorImpl implements AudioMetadataEditor {
  @override
  Future<Result<Failure, void>> changeAudioMetadata(
      {required String audioPath, required AudioMetadata audioMetadata}) async {
    Uint8List? imageData;

    if (audioMetadata.album?.imageUrl != null) {
      try {
        final getImageResponce = await http.get(Uri.parse(audioMetadata.album!.imageUrl!));
        if (getImageResponce.statusCode == 200) {
          imageData = getImageResponce.bodyBytes;
        }
      } on SocketException {
        return const Result.notSuccessful(NetworkFailure());
      }
    }

    await MetadataGod.writeMetadata(
        file: audioPath,
        metadata: Metadata(
            title: audioMetadata.name,
            artist: audioMetadata.artists?.join(', '),
            durationMs: audioMetadata.durationMs,
            album: audioMetadata.album?.name,
            picture: (() {
              if (imageData != null) {
                const mimeType = 'image/jpg';
                return Picture(mimeType: mimeType, data: imageData); 
              }
              return null;
            }).call(),
            albumArtist: audioMetadata.album?.artists?.join(', '),
            year: audioMetadata.realiseYear));

    return const Result.isSuccessful(null);
  }
}
