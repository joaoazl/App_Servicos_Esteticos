class UserLocal{

  String? id;
  String? name;
  String? email;
  String? password;
  String? confirmPassword;

  UserLocal({
     this.name,
     this.email,
     this.password,
     this.confirmPassword,
  });

  // Metodo para converter algum objeto para um estrutura de dados compativel com a estrutura do firebase
  Map<String, dynamic> toMap(){
    return <String, dynamic>{
      'name': name,
      'email': email,
      'password': password,
      'confirmPassword': confirmPassword
    };
  }

  //Metodo para converter um formato Json para objeto (desserializando o Map)
  factory UserLocal.fromMap(Map<String, dynamic> map){
    return UserLocal( 
    name: map['name'],
    email: map['email'],
    password: map['password'],
    confirmPassword: map['confirmPassword']);
  }

}