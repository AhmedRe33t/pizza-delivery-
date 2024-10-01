part of 'authantication_bloc_bloc.dart';

sealed class AuthanticationEvent extends Equatable {
  const AuthanticationEvent();

  @override
  List<Object?> get props => [];
}

class AuthenticationUserChanged extends AuthanticationEvent{
final MyUser? user;
const AuthenticationUserChanged (this.user);
  



}