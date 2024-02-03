import 'package:spotimax/core/util/failures/failure.dart';
import 'package:spotimax/core/util/result/result.dart';
import 'package:spotimax/features/domain/auth/shared/client_credentials.dart';
import 'package:spotimax/features/domain/auth/shared/user_credentials.dart';

abstract class NetworkAuthRepository {
  Future<Result<Failure, UserCredentials>> authorizeUser(ClientCredentials clientCredentials);
}