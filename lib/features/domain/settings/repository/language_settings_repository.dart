import 'package:spotimax/core/util/failures/failure.dart';
import 'package:spotimax/core/util/result/result.dart';

abstract class LanguageSettingsRepository {
  Future<Result<Failure, String>> getLanguage();

  Future<Result<Failure, void>> saveLanguage(String language);

  Future<Result<Failure, List<String>>> getAvailableLanguage();
}
