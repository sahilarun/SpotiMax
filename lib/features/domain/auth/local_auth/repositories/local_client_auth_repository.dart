import 'package:spotimax/core/util/failures/failure.dart';
import 'package:spotimax/core/util/result/result.dart';
import 'package:spotimax/features/domain/auth/shared/client_credentials.dart';


abstract class LocalClientAuthRepository {
  Future<Result<Failure, ClientCredentials>> getClientCredentials();
  Future<Result<Failure, void>> saveClientCredentials(ClientCredentials clientCredentials);
}
