
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizza/bloc/AuthanticationBloc/authantication_bloc_bloc.dart';
import 'package:pizza/screens/auth/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:pizza/screens/auth/blocs/sign_up_bloc/sign_up_bloc.dart';
import 'package:pizza/screens/auth/views/sign_in_screen.dart';
import 'package:pizza/screens/auth/views/sign_up_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>  with TickerProviderStateMixin{
late TabController tabController; 

@override
  void initState() {
tabController = TabController(
initialIndex: 0,  
length: 2, 
vsync:  this  );

super.initState();
  }
 @override
  Widget build(BuildContext context) {
    return  Scaffold(
  backgroundColor: const Color.fromARGB(255, 245, 241, 241),
  body: SingleChildScrollView(
    child: SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          Align(
            alignment: const AlignmentDirectional(20, -1.2),
            child: Container(
              height: MediaQuery.of(context).size.width,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.tealAccent
              ),
            ),
          ),
           Align(
            alignment: const AlignmentDirectional(2.7, -1.2),
            child: Container(
              height: MediaQuery.of(context).size.width/1.3,
              width: MediaQuery.of(context).size.width/1.3,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue
              ),
            ),
          ),
          BackdropFilter(
            filter:ImageFilter.blur(sigmaX: 100.0,sigmaY: 100.0),
            child: Container(),
            ),
            Align(
            alignment: Alignment.center,
            child: Container(
              height: MediaQuery.of(context).size.height/1.8,
             
             child: Column(
              children: [
                Padding(padding:const EdgeInsets.symmetric(horizontal: 50),
                child: TabBar(
                  controller: tabController,
                 unselectedLabelColor: Theme.of (context) .colorScheme.onPrimary,
                 labelColor: Colors.black,
                  tabs: const[
                    Padding(padding:EdgeInsets.all(12),
                    child: Text('SignIn',
                    style: TextStyle(
                     fontSize:18,))
                    
                    ),
                    Padding(padding:EdgeInsets.all(12),
                    child: Text('SignUp',
                    style: TextStyle(
                     fontSize:18,))
                    
                    ),
                   
                  ]
                ),),
                 Expanded(
                      child: TabBarView(
                        controller: tabController,
                        children: [
                          BlocProvider<SignInBloc>(
                            create:(context) => SignInBloc(
                              context.read<AuthanticationBloc>().userRepository
                            ),
                            child:const SignInScreen(),),

                             BlocProvider<SignUpBloc>(
                            create:(context) => SignUpBloc(
                              context.read<AuthanticationBloc>().userRepository
                            ),
                            child: const SignUpScreen(),),
                        ])
                      
                      )
              ],
             ),
            ),
          ),
        ],
      ),
    ),
  ),


    );
  }
}