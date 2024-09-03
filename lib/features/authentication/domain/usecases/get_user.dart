import 'package:wisata_ticketing/core/usecase/usecase.dart';
import 'package:wisata_ticketing/core/utils/utils.dart';
import 'package:wisata_ticketing/features/authentication/domain/entities/user.dart';
import 'package:wisata_ticketing/features/authentication/domain/repositories/auth_repository.dart';

class GetUser extends Usecase<User?> {
  const GetUser(this._repository);

  final AuthRepository _repository;

  @override
  ResultFuture<User?> call() async => _repository.getUser();
}