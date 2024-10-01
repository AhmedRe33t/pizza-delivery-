import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pizza/user_repository/scr/models/user.dart';
import 'package:pizza/user_repository/scr/user_repo.dart';

class FirebaseRepository implements UserRepository{


  
  final FirebaseAuth _firebaseAuth;

  final usersCollection = FirebaseFirestore.instance.collection('users');

  FirebaseRepository({FirebaseAuth? firebaseAuth }) :_firebaseAuth=firebaseAuth??FirebaseAuth.instance;

  @override
  Future<void> logOut() {
    // TODO: implement logOut
    throw UnimplementedError();
  }

  @override
  Future<void> setUserData(MyUser user) {
    // TODO: implement setUserData
    throw UnimplementedError();
  }

  @override
  Future<void> signIn(String email, String password) {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  Future<MyUser?> signUp(MyUser myUser, String password) {
    // TODO: implement signUp
    throw UnimplementedError();
  }

  @override
  // TODO: implement user
  Stream<MyUser?> get user => throw UnimplementedError();
 
}