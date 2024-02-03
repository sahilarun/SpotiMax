import 'package:spotimax/core/util/failures/failure.dart';
import 'package:spotimax/core/util/result/result.dart';
import 'package:spotimax/features/domain/auth/shared/user_credentials.dart';

abstract class LocalUserAuthRepository {
  Future<Result<Failure, void>> clearUserCredentials();

  Future<Result<Failure, void>> saveUserCredentials(UserCredentials userCredentials);
}
