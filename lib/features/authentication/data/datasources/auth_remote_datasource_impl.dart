import 'package:wisata_ticketing/core/core.dart';
import 'package:wisata_ticketing/core/errors/errors.dart';
import 'package:wisata_ticketing/features/authentication/data/datasources/auth_local_datasource.dart';
import 'package:wisata_ticketing/features/authentication/data/datasources/auth_remote_datasource.dart';
import 'package:wisata_ticketing/features/authentication/data/models/auth_response_model.dart';
import 'package:wisata_ticketing/features/authentication/domain/entities/user.dart';
import 'package:http/http.dart' as http;
import 'package:wisata_ticketing/features/authentication/domain/usecases/login.dart';

class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {

  const AuthRemoteDatasourceImpl(
      this._client,
      this._localDatasource,
   );

  final http.Client _client;
  final AuthLocalDatasource _localDatasource;

  @override
  Future<AuthResponseModel> login({
    required LoginParams params
  }) async {
    try {
      final response = await _client.post(
          Uri.parse('$baseURL/$loginEndpoint'),
          body: params.toJson(),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json'
          }
      );

      final bodyData = AuthResponseModel.fromJson(response.body);

      if (!successStatusCodes.contains(response.statusCode)) {
        throw APIException(
            message: bodyData.message ?? response.body,
            statusCode: response.statusCode
        );
      }

      return bodyData;
    } on APIException {
      rethrow;
    } catch (exception) {
      throw APIException(
          message: exception.toString(),
          statusCode: 505
      );
    }
  }

  @override
  Future<User> getUser() async {
    try {
      final response = await _client.post(
          Uri.http(baseURL, loginEndpoint),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json'
          }
      );

      if (!successStatusCodes.contains(response.statusCode)) {
        throw APIException(
            message: response.body,
            statusCode: response.statusCode
        );
      }

      return User.fromJson(response.body);
    } on APIException {
      rethrow;
    } catch (exception) {
      throw APIException(
          message: exception.toString(),
          statusCode: 505
      );
    }
  }

  @override
  Future<void> logout() async {
    try {
      final authData = await _localDatasource.getAuthData();
      final token = authData?.data?.token;
      final response = await _client.post(
          Uri.http(baseURL, logoutEndpoint),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token'
          }
      );

      if (!successStatusCodes.contains(response.statusCode)) {
        throw APIException(
            message: response.body,
            statusCode: response.statusCode
        );
      }
    } on APIException {
      rethrow;
    } catch (exception) {
      throw APIException(
          message: exception.toString(),
          statusCode: 505
      );
    }
  }
}