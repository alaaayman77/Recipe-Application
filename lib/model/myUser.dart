class MyUser {
  String? id;
  String? userName;
  String? email;

  MyUser({required this.id,required this.email, required this.userName});


  Map<String,dynamic> toFireStore(){
    return{
      'id':id,
      'name':userName,
      'email':email,
    };
  }

  MyUser.fromFireStore(Map<String,dynamic>?data):this(
      id: data?['id'],
      userName: data?['userName'],
      email: data?['email']
  );

}