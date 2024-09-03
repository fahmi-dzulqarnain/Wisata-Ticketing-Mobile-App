import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:wisata_ticketing/core/usecase/usecase_with_param.dart';
import 'package:wisata_ticketing/core/utils/type_definition.dart';
import 'package:wisata_ticketing/features/authentication/data/models/auth_response_model.dart';

import '../repositories/auth_repository.dart';

class Login extends UsecaseWithParam<void, LoginParams> {
  const Login(this._repository);

  final AuthRepository _repository;

  @override
  ResultFuture<AuthResponseModel> call(params) async =>
      _repository.login(params: params);
}

class LoginParams extends Equatable {
  const LoginParams({
    required this.email,
    required this.password
  });

  final String email;
  final String password;

  @override
  List<Object?> get props => [email, password];

  factory LoginParams.fromJson(String str) =>
      LoginParams.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LoginParams.fromMap(
      Map<String, dynamic> json
      ) => LoginParams(
    email: json["email"],
    password: json["password"],
  );

  Map<String, dynamic> toMap() => {
    "email": email,
    "password": password,
  };
}