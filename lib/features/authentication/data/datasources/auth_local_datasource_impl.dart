import 'package:wisata_ticketing/core/service/shared_preferences_service.dart';
import 'package:wisata_ticketing/features/authentication/data/datasources/auth_local_datasource.dart';
import 'package:wisata_ticketing/features/authentication/data/models/auth_response_model.dart';

class AuthLocalDatasourceImpl implements AuthLocalDatasource {

  const AuthLocalDatasourceImpl(this._sharedPreference);

  final SharedPreferencesService _sharedPreference;

  @override
  Future<void> cacheAuthData({
    required AuthResponseModel response
  }) async {
    await _sharedPreference
        .setString(authDataKey, response.toJson());
  }

  @override
  Future<void> removeAuthData() async {
    await _sharedPreference.remove(authDataKey);
  }

  @override
  Future<AuthResponseModel?> getAuthData() async {
    final data = await _sharedPreference.getString(authDataKey);

    if (data == null) {
      return null;
    }

    return AuthResponseModel.fromJson(data);
  }
}