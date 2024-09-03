
import 'package:wisata_ticketing/core/utils/type_definition.dart';

abstract class Usecase<Type> {
  const Usecase();

  ResultFuture<Type> call();
}