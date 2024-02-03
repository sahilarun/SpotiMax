import 'package:spotimax/core/util/failures/failure.dart';
import 'package:spotimax/core/util/result/result.dart';
import 'package:spotimax/features/domain/auth/shared/full_credentials.dart';


abstract class LocalFullAuthRepository {
  Future<Result<Failure, FullCredentials>> getFullCredentials();

  Future<Result<Failure, void>> saveFullCredentials(FullCredentials fullCredentials);
}
