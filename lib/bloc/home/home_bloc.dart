import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:utopia_validator/repository/home_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository _homeRepository;

  HomeBloc(this._homeRepository) : super(HomeInitial()) {
    on<HomeLoadEvent>(_loadUser);
  }

  FutureOr<void> _loadUser(HomeEvent event, Emitter<HomeState> emit) {
    final user = _homeRepository.getCurrentUser();
    emit(HomeLoaded(user: user));
  }
}
