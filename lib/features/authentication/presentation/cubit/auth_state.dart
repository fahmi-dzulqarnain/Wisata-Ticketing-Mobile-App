part of 'auth_cubit.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;
  const factory AuthState.loading() = _Loading;

  const factory AuthState.loggedIn(AuthResponseModel responseData) = _LoggedIn;
  const factory AuthState.userLoaded(User? userData) = _UserLoaded;
  const factory AuthState.errorLogin(String errorMessage) = _Error;
  const factory AuthState.loggedOut() = _LoggedOut;
}
