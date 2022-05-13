import 'package:app/models/user/user_local.dart';
import 'package:app/models/user/user_services.dart';
import 'package:app/screens/home/home_screen.dart';
import 'package:app/screens/login/signup_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  UserLocal userLocal = UserLocal();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(
              width: 180,
              height: 180,
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
              padding: const EdgeInsets.all(35.0),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),),
                elevation: 3.0,
                color: Colors.grey.shade200,
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    children: [
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Theme(
                              data: ThemeData(primaryColor: Colors.black),
                              child: TextFormField(
                                onSaved: (value) => userLocal.email = value,
                                initialValue: userLocal.email,
                                decoration:
                                    const InputDecoration(hintText: 'E-mail', prefixIcon: Icon(Icons.email), enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFF000000)))),
                                validator: (value) {
                                  if (value == null) {
                                    return 'Por favor, insira o e-mail!';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            TextFormField(
                              onSaved: (value) => userLocal.password = value,
                              initialValue: userLocal.password,
                              decoration:
                                  const InputDecoration(hintText: 'Senha', prefixIcon: Icon(Icons.lock), enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFF000000)))),
                              validator: (value) {
                                if (value == null) {
                                  return 'Por favor, insira o senha!';
                                }
                                return null;
                              },
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            OutlinedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  _formKey.currentState!.save();
                                  UserServices _userServices = UserServices();
                                  _userServices.singin(userLocal, onSucess: () {
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                HomeScreen()));
                                  }, onFail: (e) {
                                    Text('$e');
                                  });
                                }
                              },
                              child: const Text('Entrar'),
                            ),
                            OutlinedButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => SignUpScreen(),
                                  ),
                                );
                              },
                              child: const Text('Cadastrar-se'),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
