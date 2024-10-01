import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pizza/app.dart';
import 'package:pizza/firebase_options.dart';
import 'package:pizza/user_repository/scr/firebase_repo.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp( MyApp(userRepository: FirebaseRepository(),));
}

