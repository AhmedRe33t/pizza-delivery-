


import '../entities/user_intity.dart';

class MyUser{
  String userId;
  String name;
  String email;
  
  bool hasActiveCart;
  
  MyUser({
    required this.userId,
    required this.email,
    required this.name,
    required this.hasActiveCart,
    
  });

 
static final empty = MyUser(
userId:'',
email: '',
name:'',
hasActiveCart: false, );

MyUserEntity toEntity() {
return MyUserEntity ( 
  userId: userId, 
email: email,
 name: name,
 hasActiveCart: hasActiveCart,);}

  static MyUser fromEntity(MyUserEntity entity) {
return MyUser(
  userId:entity. userId,
  email:entity.email,
  name:entity.name,
  hasActiveCart:entity.hasActiveCart
);}


String toString(){
  return 'MyUser: $userId, $email, $name ,$hasActiveCart ';
}

}