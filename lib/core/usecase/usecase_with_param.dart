import 'package:wisata_ticketing/core/utils/type_definition.dart';

abstract class UsecaseWithParam<Type, Params> {
  const UsecaseWithParam();

  ResultFuture<Type> call(Params params);
}