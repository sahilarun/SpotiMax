import 'package:spotimax/core/util/converters/base_value_converter.dart/base_value_converter.dart';
import 'package:spotimax/core/util/failures/failures.dart';
import 'package:spotimax/core/util/result/result.dart';

abstract class ResultValueConverter<T1, T2>
    implements BaseValueConverter<Result<ConverterFailure, T1>, T2, Result<ConverterFailure, T2>, T1> {}
