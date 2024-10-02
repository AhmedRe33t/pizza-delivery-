import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizza/app_view.dart';
import 'package:pizza/bloc/AuthanticationBloc/authantication_bloc_bloc.dart';
import 'package:pizza/user_repository/user_repository.dart';

class MyApp extends StatelessWidget {
  final UserRepository userRepository;
  const MyApp({super.key, required this.userRepository});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<AuthanticationBloc>(
      create: (context)=>AuthanticationBloc(userRepository:userRepository),
      child:const MyAppView(),
      );
  }
}