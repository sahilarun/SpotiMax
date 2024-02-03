import 'package:spotimax/core/util/failures/failure.dart';
import 'package:spotimax/core/util/result/result.dart';
import 'package:spotimax/core/util/use_case/use_case.dart';
import 'package:spotimax/features/domain/auth/service/service/auth_service.dart';

class AuthorizeUser implements UseCase<Failure, void, void> {
  AuthorizeUser({required AuthService authService}) : _authService = authService;

  final AuthService _authService;

  @override
  Future<Result<Failure, void>> call(void params) {
    return _authService.authorizeUser();
  }
}