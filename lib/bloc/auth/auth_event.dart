part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class SignInRequestEvent extends AuthEvent {}

class SignOutRequestEvent extends AuthEvent {}
