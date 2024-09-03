import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wisata_ticketing/features/authentication/data/models/auth_response_model.dart';
import 'package:wisata_ticketing/features/authentication/domain/usecases/login.dart';
import 'package:wisata_ticketing/features/authentication/domain/usecases/logout.dart';

import '../../domain/entities/user.dart';
import '../../domain/usecases/get_user.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

class AuthCubit extends Cubit<AuthState> {

  AuthCubit({
    required Login login,
    required GetUser getUser,
    required Logout logout
  }) :
        _login = login,
        _getUser = getUser,
        _logout = logout,
        super(const _Initial());

  final Login _login;
  final GetUser _getUser;
  final Logout _logout;

  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(const _Loading());

    final result = await _login(
        LoginParams(
          email: email,
          password: password,
        )
    );

    result.fold(
      (error) => emit(_Error(error.message)),
      (responseData) => emit(_LoggedIn(responseData))
    );
  }

  Future<void> getUser() async {
    emit(const _Loading());

    final result = await _getUser();

    result.fold(
      (error) => emit(_Error(error.errorMessage)),
      (user) => emit(_UserLoaded(user))
    );
  }

  Future<void> logout() async {
    emit(const _Loading());

    final result = await _logout();

    result.fold(
       (error) => emit(_Error(error.errorMessage)),
       (user) => emit(const _LoggedOut())
    );
  }
}
