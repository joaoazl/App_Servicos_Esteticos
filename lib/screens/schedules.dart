import 'package:app/models/client.dart';
import 'package:app/models/client_service.dart';
import 'package:app/models/service.dart';
import 'package:app/models/servicos_service.dart';
import 'package:flutter/material.dart';
import "package:provider/provider.dart";

class ScheduleAddScreen extends StatefulWidget {
  const ScheduleAddScreen({Key? key}) : super(key: key);

  @override
  State<ScheduleAddScreen> createState() => _ScheduleAddScreenState();
}

class _ScheduleAddScreenState extends State<ScheduleAddScreen> {

  List<Client> valueList = [
    Client(
            id: null,
            name: 'Nenhum cliente selecionado',
            dt_nasc: '',
            email: '',
            telefone: '',
          )
  ];

  late Client client;

  final listService = ServicosService();
  final listClients = ClientService();

  late bool isButtonActive = true;

  var valCheck = false;

  List<bool>? isChecked;

  @override
  initState(){
    super.initState();
    listClients.getList().then((value){
      setState(() {

        valueList.addAll( 
        value.docs
        .map(
          (e) => Client(
            id: e.id,
            name: e.get('name'),
            dt_nasc: e.get('dt_nasc'),
            email: e.get('email'),
            telefone: e.get('telefone'),
          )
        ).toList());
      });
    });
    client = valueList[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Realizar Agendamento'),
        backgroundColor: const Color.fromARGB(255, 3, 201, 108),
        centerTitle: true,
      ),
      body: Center(
        child: Form(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    width: 300.0,
                    child: DropdownButtonFormField<Client>(
                      value: client,
                      items: valueList
                          .map((value) => DropdownMenuItem<Client>(
                              value: value, child: Text(value.name)))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          client = value!;
                            isButtonActive = value.id == null;
                        });
                      },
                    ),
                  ),
                  OutlinedButton(
                    onPressed: isButtonActive
                        ? () {
                            setState(() {
                              Navigator.of(context).pushNamed('/registerClients');
                            });
                          }
                        : null,
                    child: const Text('Cadastrar'),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 20),
                child: Text(
                  'Selecionar Serviços',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 3, 201, 108)),
                ),
              ),
              SizedBox(
                height: 270,
                child: Consumer<ServicosService>(
                  builder: (_, servicosService, __) {
                    List<Service> listAllServices =
                        servicosService.allServices;
                    return ListView.builder(
                      itemBuilder: (context, index) {
                        return CheckboxListTile(
                            title: Text(listAllServices[index].name),
                            value: listAllServices[index].isChecked,
                            onChanged: (value) {
                              setState(() {
                                listAllServices[index].isChecked = value!;
                                debugPrint('$index');
                              });
                            });
                      },
                      itemCount: listAllServices.length,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
