import 'package:app/helpers/validator.dart';
import 'package:app/models/user/user_local.dart';
import 'package:app/models/user/user_services.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  UserLocal userLocal = UserLocal();

SignUpScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text('Criar Conta de Usúario'),
        centerTitle: true,
      ),
      body: Center(
          child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: formKey,
          child: ListView(
            padding: const EdgeInsets.all(16),
            shrinkWrap: true,
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(hintText: 'Nome Completo'),
                validator: (name) {
                  if (name!.isEmpty) {
                    return 'Campo obrigatorio';
                  } else if (name.trim().split('').length <= 1) {
                    return 'Preencha seu nome Completo';
                  }

                  return null;
                },
                onSaved: (name) => userLocal.name = name,
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                decoration: const InputDecoration(hintText: 'Email'),
                keyboardType: TextInputType.emailAddress,
                validator: (email) {
                  if (email!.isEmpty) {
                    return 'Campo obrigatório';
                  } else if (!emailValidator(email)) {
                    return 'E-mail invalido!!!';
                  }
                  return null;
                },
                onSaved: (email) => userLocal.email = email,
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                decoration: const InputDecoration(hintText: 'senha'),
                obscureText: true,
                validator: (password) {
                  if (password!.isEmpty) {
                    return 'Campo obrigatório!!!';
                  } else if (password.length < 6) {
                    return ' Senha deve ter ao menos 6 caracteres!!!';
                  }
                  return null;
                },
                onSaved: (password) => userLocal.password = password,
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                decoration: const InputDecoration(hintText: 'Repita a senha'),
                obscureText: true,
                validator: (password) {
                  if (password!.isEmpty) {
                    return 'Campo obrigatorio!!!';
                  } else if (password.length < 6) {
                    return ' Senha deve ter ao menos 6 caracteres!!!';
                  }
                  return null;
                },
                onSaved: (password) => userLocal.confirmPassword = password,
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    if (userLocal.password != userLocal.confirmPassword) {
                      const ScaffoldMessenger(
                        child: SnackBar(
                          content: Text(
                            'Senhas não coincidem!!!',
                            style: TextStyle(fontSize: 11),
                          ),
                          backgroundColor: Colors.red,
                        ),
                      );
                      return;
                    }
                    UserServices user_service = UserServices();
                    user_service.signUp(
                      userLocal,
                      onSucess: () {
                        Navigator.of(context).pop();
                      },
                      onFail: (e) {
                        ScaffoldMessenger(
                          child: SnackBar(
                            content: Text(
                              'Falha ao registrar usuário: $e',
                              style: const TextStyle(fontSize: 11),
                            ),
                            backgroundColor: Colors.red,
                          ),
                        );
                      },
                    );
                  }
                },
                child: const Text(
                  'Criar conta',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}