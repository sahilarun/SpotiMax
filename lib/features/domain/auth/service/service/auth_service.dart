import 'package:spotimax/core/util/failures/failure.dart';
import 'package:spotimax/core/util/result/result.dart';

abstract class AuthService {
    Future<Result<Failure, void>> authorizeUser();
}