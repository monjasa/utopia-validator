part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class Authenticated extends AuthState {}

class Unauthenticated extends AuthState {}
