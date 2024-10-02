

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizza/bloc/AuthanticationBloc/authantication_bloc_bloc.dart';
import 'package:pizza/pizza_repository/pizza_repository.dart';
import 'package:pizza/screens/auth/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:pizza/screens/home/blocs/get_pizza_bloc/get_pizza_bloc.dart';


import 'screens/auth/views/welcome_screen.dart';
import 'screens/home/views/home_screen.dart';

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Pizza Delivery',
        debugShowCheckedModeBanner: false,
        // theme: ThemeData(colorScheme: ColorScheme.light(
        //   //background: Colors.grey.shade200,
        //  // onBackground: Colors.black,
        //    primary: Colors.blue, onPrimary: Colors.white)),
        home: BlocBuilder<AuthanticationBloc, AuthenticationState>(
          builder: ((context, state) {
            if (state.status == AuthenticationStatus.authentIcated) {
              return MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create: (context) => SignInBloc(context.read<AuthanticationBloc>().userRepository),
                  ),
                  BlocProvider(
                    create: (context) => GetPizzaBloc(
                      FirebasePizzaRepo()
                    )..add(GetPizza()),
                  ),
                ],
                child: const HomeScreen(),
              );
            } else {
              return const WelcomeScreen();
            }
          }),
        ));
  }
}