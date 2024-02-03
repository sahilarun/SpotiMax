import 'package:spotimax/core/util/failures/failure.dart';
import 'package:spotimax/core/util/result/result.dart';
import 'package:spotimax/features/domain/settings/enitities/download_tracks_settings.dart';

abstract class DownloadTracksSettingsRepository {
  Future<Result<Failure, DownloadTracksSettings>> getDownloadTracksSettings();
  Future<Result<Failure, void>> saveDownloadTracksSettings(DownloadTracksSettings downloadTracksSettings);
}