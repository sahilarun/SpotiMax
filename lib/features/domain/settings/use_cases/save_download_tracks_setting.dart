import 'package:spotimax/core/util/failures/failure.dart';
import 'package:spotimax/core/util/result/result.dart';
import 'package:spotimax/core/util/use_case/use_case.dart';
import 'package:spotimax/features/domain/settings/enitities/download_tracks_settings.dart';
import 'package:spotimax/features/domain/settings/repository/download_tracks_settings_repository.dart';

class SaveDownloadTracksSettings implements UseCase<Failure, void, DownloadTracksSettings> {
  SaveDownloadTracksSettings({required DownloadTracksSettingsRepository downloadTracksSettingsRepository})
      : _downloadTracksSettingsRepository = downloadTracksSettingsRepository;

  final DownloadTracksSettingsRepository _downloadTracksSettingsRepository;

  @override
  Future<Result<Failure, void>> call(DownloadTracksSettings downloadTracksSettings) async {
    return _downloadTracksSettingsRepository.saveDownloadTracksSettings(downloadTracksSettings);
  }
}
