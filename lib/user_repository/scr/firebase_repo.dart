import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pizza/user_repository/scr/entities/user_intity.dart';
import 'package:pizza/user_repository/scr/models/user.dart';
import 'package:pizza/user_repository/scr/user_repo.dart';
import 'package:rxdart/rxdart.dart';
class FirebaseRepository implements UserRepository{


  
  final FirebaseAuth _firebaseAuth;

  final usersCollection = FirebaseFirestore.instance.collection('users');

  FirebaseRepository({FirebaseAuth? firebaseAuth }) :_firebaseAuth=firebaseAuth??FirebaseAuth.instance;



  @override
  Stream<MyUser?> get user {
    return _firebaseAuth.authStateChanges().flatMap((firebaseUser)async*{
     if(firebaseUser==null){
       yield MyUser.empty;
     }else{
      yield await usersCollection.doc(firebaseUser.uid).get().then((value)=>MyUser.fromEntity(MyUserEntity.fromDocument(value.data()!)));
     }
    });
  }


   @override
  Future<void> signIn(String email, String password)async {
    try {
  await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
} catch (e) {
  log(e.toString());
   rethrow ;
}
  }

  @override
  Future<MyUser> signUp(MyUser myUser, String password)async {
     
     try {
  UserCredential user =await FirebaseAuth.instance.createUserWithEmailAndPassword(email:myUser.email , password: password);
  myUser.userId=user.user!.uid;
  return myUser;
}  catch (e) {
  log(e.toString());
  rethrow;
}
  }


  @override
  Future<void> logOut()async {
await _firebaseAuth .signOut();   
  }

  @override
  Future<void> setUserData(MyUser user)async {
      try {
  usersCollection.doc(user.userId).set(user.toEntity().toDocument());
}  catch (e) {
  log(e.toString());
  rethrow;
}
  }

 

 
}