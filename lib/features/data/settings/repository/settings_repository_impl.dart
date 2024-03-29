import 'package:spotimax/core/util/failures/failure.dart';
import 'package:spotimax/core/util/result/result.dart';
import 'package:spotimax/features/data/settings/data_source/settings_data_source.dart';
import 'package:spotimax/features/data/settings/models/app_settings.dart';
import 'package:spotimax/features/domain/settings/enitities/download_tracks_settings.dart';
import 'package:spotimax/features/domain/settings/enitities/save_mode.dart';
import 'package:spotimax/features/domain/settings/repository/download_tracks_settings_repository.dart';
import 'package:spotimax/features/domain/settings/repository/language_settings_repository.dart';

class SettingsRepositoryImpl implements DownloadTracksSettingsRepository, LanguageSettingsRepository {
  SettingsRepositoryImpl({required SettingsDataSource settingsDataSource}) : _settingsDataSource = settingsDataSource;

  final SettingsDataSource _settingsDataSource;
  AppSettings? _currentSettings;

  @override
  Future<Result<Failure, DownloadTracksSettings>> getDownloadTracksSettings() async {
    final getSettingsResult = await _getSettings();
    if (!getSettingsResult.isSuccessful) {
      return Result.notSuccessful(getSettingsResult.failure);
    }

    return Result.isSuccessful(DownloadTracksSettings(
        savePath: _currentSettings!.savePath, saveMode: SaveMode.values[_currentSettings!.saveMode]));
  }

  @override
  Future<Result<Failure, void>> saveDownloadTracksSettings(DownloadTracksSettings downloadTracksSettings) async {
    final getSettingsResult = await _getSettings();
    if (!getSettingsResult.isSuccessful) {
      return Result.notSuccessful(getSettingsResult.failure);
    }

    final newSettings = AppSettings(
        savePath: downloadTracksSettings.savePath,
        saveMode: downloadTracksSettings.saveMode.index,
        language: getSettingsResult.result!.language);
    return _saveSettings(newSettings);
  }

  @override
  Future<Result<Failure, String>> getLanguage() async {
    final getSettingsResult = await _getSettings();
    if (!getSettingsResult.isSuccessful) {
      return Result.notSuccessful(getSettingsResult.failure);
    }

    return Result.isSuccessful(getSettingsResult.result!.language);
  }

  @override
  Future<Result<Failure, void>> saveLanguage(String language) async {
    final getSettingsResult = await _getSettings();
    if (!getSettingsResult.isSuccessful) {
      return Result.notSuccessful(getSettingsResult.failure);
    }

    final newSettings = AppSettings(
        savePath: getSettingsResult.result!.savePath,
        saveMode: getSettingsResult.result!.saveMode,
        language: language);
    return _saveSettings(newSettings);
  }

  Future<Result<Failure, AppSettings>> _getSettings() async {
    if (_currentSettings == null) {
      final getSettingsResult = await _settingsDataSource.getSettings();
      if (getSettingsResult.isSuccessful) {
        if (getSettingsResult.result != null) {
          _currentSettings = getSettingsResult.result;
        } else {
          _currentSettings = AppSettings.deffault;
        }
      } else {
        return Result.notSuccessful(getSettingsResult.failure);
      }
    }

    return Result.isSuccessful(_currentSettings);
  }

  Future<Result<Failure, void>> _saveSettings(AppSettings newSettings) async {
    _currentSettings = newSettings;
    await _settingsDataSource.saveSettings(newSettings);
    return const Result.isSuccessful(null);
  }

  @override
  Future<Result<Failure, List<String>>> getAvailableLanguage() async {
    return const Result.isSuccessful(['en', 'ru']);
  }
}
