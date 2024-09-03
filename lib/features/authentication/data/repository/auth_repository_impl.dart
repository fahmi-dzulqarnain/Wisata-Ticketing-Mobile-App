import 'package:dartz/dartz.dart';
import 'package:wisata_ticketing/core/errors/errors.dart';
import 'package:wisata_ticketing/core/utils/utils.dart';
import 'package:wisata_ticketing/features/authentication/data/datasources/auth_local_datasource.dart';
import 'package:wisata_ticketing/features/authentication/data/datasources/auth_remote_datasource.dart';
import 'package:wisata_ticketing/features/authentication/data/models/auth_response_model.dart';
import 'package:wisata_ticketing/features/authentication/domain/entities/user.dart';
import 'package:wisata_ticketing/features/authentication/domain/repositories/auth_repository.dart';
import 'package:wisata_ticketing/features/authentication/domain/usecases/login.dart';

class AuthRepositoryImpl implements AuthRepository {

  const AuthRepositoryImpl(
      this._remoteDataSource,
      this._localDataSource
  );

  final AuthRemoteDatasource _remoteDataSource;
  final AuthLocalDatasource _localDataSource;

  @override
  ResultFuture<AuthResponseModel> login({
    required LoginParams params
  }) async {

    try {
      final response = await _remoteDataSource.login(params: params);

      await _localDataSource.cacheAuthData(response: response);

      return Right(response);

    } on APIException catch (exception) {
      return Left(APIFailure.fromException(exception));
    }
  }

  @override
  ResultFuture<User?> getUser() async {

    try {
      // final result = await _remoteDataSource.getUser();
      final authData = await _localDataSource.getAuthData();
      final user = authData?.data?.user;

      return Right(user);
    } on APIException catch (exception) {
      return Left(APIFailure.fromException(exception));
    }
  }

  @override
  ResultVoid logout() async {
    try {
      await _remoteDataSource.logout();
      await _localDataSource.removeAuthData();

      return const Right(null);

    } on APIException catch (exception) {
      return Left(APIFailure.fromException(exception));
    }
  }
}