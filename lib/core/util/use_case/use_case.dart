import 'package:spotimax/core/util/result/result.dart';

abstract class UseCase<Failure, Type, Params> {
  Future<Result<Failure, Type>> call(Params params);
}