import 'package:app/models/user/user_local.dart';
import 'package:app/models/user/user_services.dart';
import 'package:app/screens/home/home_screen.dart';
import 'package:app/screens/login/signup_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({ Key? key }) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  UserLocal userLocal = UserLocal();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[
          const Image(
            width: 280,
            height: 280,
            image: AssetImage('./assets/images/home.png'),
          ),
          const Text(
            'Serviços Estéticos',
            style: TextStyle(
            color: Colors.green,
            fontSize: 28,
            fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left:30, right: 30, top:30, bottom: 40),
            child: Card(
              elevation: 1.0,
              color: Colors.grey.shade200,
              child: Column(
                children: [
                  Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Column(
                        children: [
                          TextFormField(
                            onSaved: (value) => userLocal.email = value,
                            initialValue: userLocal.email,
                            decoration: const InputDecoration(hintText: 'E-mail'),
                            validator: (value){
                              if (value == null){
                                return 'Por favor, insira o e-mail!';
                              }
                              return null;
                            },
                          ),
                        const SizedBox(height: 30,),
                          TextFormField(
                            onSaved: (value) => userLocal.password = value,
                            initialValue: userLocal.password,
                            decoration: const InputDecoration(hintText: 'Senha'),
                            validator: (value){
                              if (value == null){
                                return 'Por favor, insira o senha!';
                              }
                              return null;
                            },
                          )
                      ],
                  ),
                    ),
            ),
            SizedBox(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                OutlinedButton(
                  onPressed: (){
                    if(_formKey.currentState!.validate()){
                      _formKey.currentState!.save();
                      UserServices _userServices = UserServices();
                      _userServices.singin(userLocal, 
                      onSucess: (){
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => HomeScreen())
                        );
                      }, onFail: (e){
                        Text('$e');
                      } 
                      );

                    }
                  },
                   child: const Text('Entrar'),),
                OutlinedButton(onPressed: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => SignUpScreen(),
                    ),
                  );
                }, child: const Text('Cadastrar-se'),),
              ],
              ),
            ),
            const SizedBox(height: 30,)
                ],
              ),

            ),
          )
        ],
      ),
    );
  }
}