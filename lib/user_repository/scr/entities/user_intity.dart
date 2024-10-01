class MyUserEntity{
  String userId;
  String name;
  String email;
  bool hasActiveCart;
  
  MyUserEntity({
    required this.userId,
    required this.email,
    required this.name,
    required this.hasActiveCart,
    
  });
  
  Map<String,dynamic> toDocument(){
    return {
      'userId':userId,
      'name':name,
      'email':email,
      'hasActiveCart':hasActiveCart

    };
  }
  static MyUserEntity fromDocument (Map<String, dynamic> doc){
       return MyUserEntity(
        email: doc['email'],
        userId: doc['userId'],
        name: doc['name'], 
        hasActiveCart: doc['hasActiveCart'],
        
       );
  }
  
  }