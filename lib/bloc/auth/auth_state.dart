part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class UserAuthenticated extends AuthState {}

class UserUnauthenticated extends AuthState {}
