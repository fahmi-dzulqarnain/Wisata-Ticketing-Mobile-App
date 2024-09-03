import 'package:wisata_ticketing/core/utils/utils.dart';
import 'package:wisata_ticketing/features/authentication/data/models/auth_response_model.dart';
import 'package:wisata_ticketing/features/authentication/domain/entities/user.dart';
import 'package:wisata_ticketing/features/authentication/domain/usecases/login.dart';

abstract class AuthRepository {
  const AuthRepository();

  ResultFuture<AuthResponseModel> login({
    required LoginParams params
  });

  ResultFuture<User?> getUser();

  ResultVoid logout();
}