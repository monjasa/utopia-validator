import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:utopia_validator/repository/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;

  AuthBloc(this._authRepository) : super(Unauthenticated()) {
    on<SignInRequestEvent>(_signIn);
    on<SignOutRequestEvent>(_signOut);
  }

  FutureOr<void> _signIn(SignInRequestEvent event, Emitter<AuthState> emit) {
    _authRepository.signIn();
    emit(Authenticated());
  }

  FutureOr<void> _signOut(SignOutRequestEvent event, Emitter<AuthState> emit) {
    _authRepository.signOut();
    emit(Unauthenticated());
  }
}
