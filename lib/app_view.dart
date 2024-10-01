import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizza/bloc/AuthanticationBloc/authantication_bloc_bloc.dart';

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food delivary',
      theme: ThemeData(
        colorScheme: ColorScheme.light(
          background: Colors.grey.shade100,
          onBackground: Colors.black,
          primary: Colors.blue,
          onPrimary: Colors.white,
        )
       ),
       home: BlocBuilder<AuthanticationBloc,AuthenticationState>(
        builder:(context, state) {
          if(state.status==AuthenticationStatus.authentIcated){
            return Container();
          }else {
            return Container();
          }
        },),
    );
  }
}