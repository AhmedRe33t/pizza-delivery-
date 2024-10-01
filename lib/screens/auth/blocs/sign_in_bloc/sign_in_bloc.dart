import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pizza/user_repository/user_repository.dart';


part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
 final UserRepository userRepository;
  SignInBloc(this.userRepository) : super(SignInInitial()) {
    on<SignInRequired>((event, emit) async{
      emit(SignInLoading() );
     try {
     
     await userRepository.signIn(event.email, event.password);

     }catch (e){
      emit(SignInFailure());
     }

    });
    on<SignOutRequired>((event, emit) async =>await userRepository.logOut());
  }
}
