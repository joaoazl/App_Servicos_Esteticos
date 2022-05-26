import 'package:app/models/service.dart';
import 'package:app/models/servicos_service.dart';
import 'package:flutter/material.dart';

class ServiceAddScreen extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  Service service = Service(
    name: 'nome',
    vlr: 'vlr',
  );

  ServiceAddScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text('Registrar Serviços'),
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
                height: 16,
              ),
              TextFormField(
                decoration: const InputDecoration(hintText: 'Nome'),
                validator: (name) {
                  if (name!.isEmpty) {
                    return 'Campo obrigatorio';
                  } else if (name.trim().split('').length <= 1) {
                    return 'Preencha o nome do serviço';
                  }

                  return null;
                },
                onSaved: (name) => service.name = name!,
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                decoration:
                    const InputDecoration(hintText: ' Valor'),
                obscureText: false,
                validator: (vlr) {
                  if (vlr!.isEmpty) {
                    return 'Campo obrigatório!!!';
                  }
                  return null;
                },
                onSaved: (vlr) => service.vlr = vlr!,
              ),
              const SizedBox(
                height: 16,
              ),
              const SizedBox(
                height: 16,
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    if (formKey.currentState!.validate() == false) {
                      const ScaffoldMessenger(
                        child: SnackBar(
                          content: Text(
                            'Verifique os dados e tende novamente!!!',
                            style: TextStyle(fontSize: 11),
                          ),
                          backgroundColor: Colors.red,
                        ),
                      );
                      return;
                    }
                    ServicosService servicosService = ServicosService();
                    servicosService.add(
                      service,
                    );
                  }
                },
                child: const Text(
                  'Registrar',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    if (formKey.currentState!.validate() == false) {
                      const ScaffoldMessenger(
                        child: SnackBar(
                          content: Text(
                            'Verifique os dados e tende novamente!!!',
                            style: TextStyle(fontSize: 11),
                          ),
                          backgroundColor: Colors.red,
                        ),
                      );
                      return;
                    }
                    ServicosService servicosService = ServicosService();
                    //servicosService.deleteService(service.id);
                  }
                },
                child: const Text(
                  'Remover Serviço',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    if (formKey.currentState!.validate() == false) {
                      const ScaffoldMessenger(
                        child: SnackBar(
                          content: Text(
                            'Verifique os dados e tende novamente!!!',
                            style: TextStyle(fontSize: 11),
                          ),
                          backgroundColor: Colors.red,
                        ),
                      );
                      return;
                    }
                    ServicosService servicosService = ServicosService();
                    servicosService.updateService(
                      service,
                    );
                  }
                },
                child: const Text(
                  'Atualizar Dados do Serviço',
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
