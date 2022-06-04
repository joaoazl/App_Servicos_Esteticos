import 'package:app/models/client.dart';
import 'package:app/models/client_service.dart';
import 'package:flutter/material.dart';

class ClientAddScreen extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  Client client = Client(
    name: '',
    dt_nasc: '',
    email: '',
    telefone: '',
  );

  ClientAddScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
         backgroundColor: const Color.fromARGB(255, 3, 221, 119),
        title: const Text('Registrar Cliente'),
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
              const SizedBox(
                height: 0,
              ),
              TextFormField(
                decoration: const InputDecoration(hintText: 'Nome '),
                validator: (name) {
                  if (name!.isEmpty) {
                    return 'Campo obrigatorio';
                  } else if (name.trim().split('').length <= 1) {
                    return 'Preencha seu nome Completo';
                  }

                  return null;
                },
                onSaved: (name) => client.name = name!,
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                decoration:
                    const InputDecoration(hintText: ' Data de Nascimento'),
                obscureText: false,
                validator: (dt_nasc) {
                  if (dt_nasc!.isEmpty) {
                    return 'Campo obrigatório!!!';
                  }
                  return null;
                },
                onSaved: (dt_nasc) => client.dt_nasc = dt_nasc!,
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                decoration: const InputDecoration(hintText: 'E-mail'),
                keyboardType: TextInputType.text,
                validator: (email) {
                  if (email!.isEmpty) {
                    return 'Campo obrigatório';
                  }
                  return null;
                },
                onSaved: (email) => client.email = email!,
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                decoration:
                    const InputDecoration(hintText: 'Telefone'),
                obscureText: true,
                validator: (telefone) {
                  if (telefone!.isEmpty) {
                    return 'Campo obrigatorio!!!';
                  }
                  return null;
                },
                onSaved: (telefone) => client.telefone = telefone!,
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: const Color.fromARGB(255, 3, 221, 119)),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    ClientService clientService = ClientService();
                    clientService.add(
                      client,
                    );
                  }else{
                      const ScaffoldMessenger(
                        child: SnackBar(
                          content: Text(
                            'Verifique os dados e tende novamente!!!',
                            style: TextStyle(fontSize: 11),
                          ),
                          backgroundColor: Colors.red,
                        ),
                      );
                    };
                },
                child: const Text(
                  'Registrar',
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
