import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotimax/core/util/failures/failure.dart';
import 'package:spotimax/features/domain/settings/use_cases/get_available_languages.dart';
import 'package:spotimax/features/domain/settings/use_cases/get_language.dart';
import 'package:spotimax/features/domain/settings/use_cases/save_language.dart';

part 'language_setting_event.dart';
part 'language_setting_state.dart';

class LanguageSettingBloc extends Bloc<LanguageSettingEvent, LanguageSettingState> {
  final GetLanguage _getLanguage;
  final SaveLanguage _saveLanguage;
  final GetAvailableLanguages _getAvailableLanguages;

  LanguageSettingBloc(
      {required GetLanguage getLanguage,
      required SaveLanguage saveLanguage,
      required GetAvailableLanguages getAvailableLanguages})
      : _getLanguage = getLanguage,
        _getAvailableLanguages = getAvailableLanguages,
        _saveLanguage = saveLanguage,
        super(LanguageSettingInitial()) {
    on<LanguageSettingLoad>(_onLoad);
    on<LanguageSettingChangeLanguage>(_onChangeLanguage);
  }

  FutureOr<void> _onChangeLanguage(LanguageSettingChangeLanguage event, emit) async {
    final saveLanguageResult = await _saveLanguage.call(event.language);
    final getAvailableLanguagesResult = await _getAvailableLanguages.call(null);

    if (!saveLanguageResult.isSuccessful) {
      emit(LanguageSettingFailure(failure: saveLanguageResult.failure));
    }

    if (!getAvailableLanguagesResult.isSuccessful) {
      emit(LanguageSettingFailure(failure: getAvailableLanguagesResult.failure));
      return;
    }

    emit(LanguageSettingChanged(
        availableLanguages: getAvailableLanguagesResult.result!, selectedLanguage: event.language));
  }

  FutureOr<void> _onLoad(event, emit) async {
    final getLanguageResult = await _getLanguage.call(null);
    final getAvailableLanguagesResult = await _getAvailableLanguages.call(null);

    if (!getLanguageResult.isSuccessful) {
      emit(LanguageSettingFailure(failure: getLanguageResult.failure));
      return;
    }

    if (!getAvailableLanguagesResult.isSuccessful) {
      emit(LanguageSettingFailure(failure: getAvailableLanguagesResult.failure));
      return;
    }

    emit(LanguageSettingChanged(
        selectedLanguage: getLanguageResult.result!, availableLanguages: getAvailableLanguagesResult.result!));
  }
}
