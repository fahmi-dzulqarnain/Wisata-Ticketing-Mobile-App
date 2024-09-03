import 'package:wisata_ticketing/features/authentication/data/models/auth_response_model.dart';
import 'package:wisata_ticketing/features/authentication/domain/usecases/login.dart';

import '../../domain/entities/user.dart';

abstract class AuthRemoteDatasource {
  Future<AuthResponseModel> login({
    required LoginParams params
  });

  Future<User> getUser();

  Future<void> logout();
}

const loginEndpoint = 'login';
const userEndpoint = 'user';
const logoutEndpoint = 'logout';
