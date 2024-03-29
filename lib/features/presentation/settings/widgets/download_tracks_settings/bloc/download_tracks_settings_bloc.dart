import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotimax/core/util/failures/failure.dart';
import 'package:spotimax/features/domain/settings/enitities/download_tracks_settings.dart';
import 'package:spotimax/features/domain/settings/enitities/save_mode.dart';
import 'package:spotimax/features/domain/settings/use_cases/get_download_tracks_settings.dart';
import 'package:spotimax/features/domain/settings/use_cases/save_download_tracks_setting.dart';

part 'download_tracks_settings_event.dart';
part 'download_tracks_settings_state.dart';

class DownloadTracksSettingsBloc extends Bloc<DownloadTracksSettingsEvent, DownloadTracksSettingsState> {
  final GetDownloadTracksSettings _getDownloadTracksSettings;
  final SaveDownloadTracksSettings _saveDownloadTracksSettings;

  DownloadTracksSettingsBloc(
      {required GetDownloadTracksSettings getDownloadTracksSettings,
      required SaveDownloadTracksSettings saveDownloadTracksSetting})
      : _getDownloadTracksSettings = getDownloadTracksSettings,
        _saveDownloadTracksSettings = saveDownloadTracksSetting,
        super(DownloadTracksSettingsInitial()) {
    on<DownloadTracksSettingsLoad>(_onLoad);

    on<DownloadTracksSettingsChangeSaveMode>(_onChangeSaveMode);

    on<DownloadTracksSettingsChangeSavePath>(_onChangeSavePath);
  }

  FutureOr<void> _onLoad(event, Emitter<DownloadTracksSettingsState> emit) async {
    final getDownloadTracksSettingsResult = await _getDownloadTracksSettings.call(null);
    if (!getDownloadTracksSettingsResult.isSuccessful) {
      emit(DownloadTracksSettingsFailure(failure: getDownloadTracksSettingsResult.failure));
      return;
    }

    emit(DownloadTracksSettingsChanged(downloadTracksSettings: getDownloadTracksSettingsResult.result!));
  }

  FutureOr<void> _onChangeSavePath(
      DownloadTracksSettingsChangeSavePath event, Emitter<DownloadTracksSettingsState> emit) async {
    final getDownloadTracksSettingsResult = await _getDownloadTracksSettings.call(null);
    if (!getDownloadTracksSettingsResult.isSuccessful) {
      emit(DownloadTracksSettingsFailure(failure: getDownloadTracksSettingsResult.failure));
      return;
    }

    final newDownloadTracksSettings =
        DownloadTracksSettings(savePath: event.savePath, saveMode: getDownloadTracksSettingsResult.result!.saveMode);
    final saveDownloadTracksSettingsResult = await _saveDownloadTracksSettings.call(newDownloadTracksSettings);
    if (!saveDownloadTracksSettingsResult.isSuccessful) {
      emit(DownloadTracksSettingsFailure(failure: saveDownloadTracksSettingsResult.failure));
      return;
    }

    emit(DownloadTracksSettingsChanged(downloadTracksSettings: newDownloadTracksSettings));
  }

  FutureOr<void> _onChangeSaveMode(
      DownloadTracksSettingsChangeSaveMode event, Emitter<DownloadTracksSettingsState> emit) async {
    final getDownloadTracksSettingsResult = await _getDownloadTracksSettings.call(null);
    if (!getDownloadTracksSettingsResult.isSuccessful) {
      emit(DownloadTracksSettingsFailure(failure: getDownloadTracksSettingsResult.failure));
      return;
    }

    final newDownloadTracksSettings =
        DownloadTracksSettings(savePath: getDownloadTracksSettingsResult.result!.savePath, saveMode: event.saveMode);
    final saveDownloadTracksSettingsResult = await _saveDownloadTracksSettings.call(newDownloadTracksSettings);
    if (!saveDownloadTracksSettingsResult.isSuccessful) {
      emit(DownloadTracksSettingsFailure(failure: saveDownloadTracksSettingsResult.failure));
      return;
    }

    emit(DownloadTracksSettingsChanged(downloadTracksSettings: newDownloadTracksSettings));
  }
}
