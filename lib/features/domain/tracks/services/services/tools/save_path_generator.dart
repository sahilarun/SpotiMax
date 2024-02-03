import 'package:spotimax/core/util/util_methods.dart';
import 'package:spotimax/features/domain/settings/enitities/download_tracks_settings.dart';
import 'package:spotimax/features/domain/settings/enitities/save_mode.dart';
import 'package:spotimax/features/domain/tracks/shared/entities/track.dart';
import 'package:path/path.dart' as p;

class SavePathGenerator {
  String generateSavePath(Track track, DownloadTracksSettings settings) {
    late final String savePath;
    if (settings.saveMode == SaveMode.folderForTracksCollection) {
      savePath = p.join(settings.savePath, formatStringToFileFormat(track.parentCollection.name));
    } else {
      savePath = p.join(settings.savePath, '_AllTracks');
    }

    return savePath;
  }
}
