import 'package:wisata_ticketing/features/authentication/data/models/auth_response_model.dart';

abstract class AuthLocalDatasource {
  Future<void> cacheAuthData({
    required AuthResponseModel response
  });

  Future<void> removeAuthData();

  Future<AuthResponseModel?> getAuthData();
}

const authDataKey = 'auth_data';