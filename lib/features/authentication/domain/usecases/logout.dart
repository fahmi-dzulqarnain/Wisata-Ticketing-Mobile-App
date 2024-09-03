import 'package:wisata_ticketing/core/usecase/usecase.dart';
import 'package:wisata_ticketing/core/utils/type_definition.dart';

import '../repositories/auth_repository.dart';

class Logout extends Usecase<void> {
  const Logout(this._repository);

  final AuthRepository _repository;

  @override
  ResultVoid call() async => _repository.logout();
}
