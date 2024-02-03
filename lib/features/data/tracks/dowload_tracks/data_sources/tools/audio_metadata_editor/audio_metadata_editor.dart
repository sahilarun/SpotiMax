import 'package:spotimax/core/util/failures/failure.dart';
import 'package:spotimax/core/util/result/result.dart';
import 'package:spotimax/features/data/tracks/dowload_tracks/models/metadata/audio_metadata.dart';

abstract class AudioMetadataEditor {
  Future<Result<Failure, void>> changeAudioMetadata({required String audioPath, required AudioMetadata audioMetadata});
}