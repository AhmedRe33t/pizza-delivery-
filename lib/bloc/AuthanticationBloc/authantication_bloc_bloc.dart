import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pizza/user_repository/scr/models/user.dart';
import 'package:pizza/user_repository/scr/user_repo.dart';

part 'authantication_bloc_event.dart';
part 'authantication_bloc_state.dart';

class AuthanticationBloc extends Bloc<AuthanticationEvent, AuthenticationState> {
  final UserRepository userRepository;
  late final StreamSubscription<MyUser?> _userSubscription;
  AuthanticationBloc({
    required this.userRepository,
  }) : super(const AuthenticationState.unknown()) {
    _userSubscription=userRepository.user.listen((user) {
      add(AuthenticationUserChanged(user));
    },);
    on<AuthenticationUserChanged>((event, emit) {
      if(event.user!=MyUser.empty){
        emit(AuthenticationState.authenticated(event.user!));
      }else{
        emit(const AuthenticationState.unauthenticated());
      }
    });
  }
  Future<void> close() {
     _userSubscription.cancel();
      return super.close();
}
}
