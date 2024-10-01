part of 'authantication_bloc_bloc.dart';

enum AuthenticationStatus { authentIcated, unauthenticated, unknown}


 class AuthenticationState extends Equatable {
  
 const AuthenticationState._({
  this.status= AuthenticationStatus.unknown,
  this.user}
);

 final AuthenticationStatus status;
 final MyUser? user;
 const AuthenticationState.unknown() : this._();
 const AuthenticationState.authenticated (MyUser myUser) :
 this._(status: AuthenticationStatus.authentIcated,user: myUser);

const AuthenticationState.unauthenticated() :
this._(status:AuthenticationStatus.unauthenticated );
List<Object?> get props => [status, user];
}