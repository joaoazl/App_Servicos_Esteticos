import 'package:app/models/client_service.dart';
import 'package:app/models/service.dart';
import 'package:app/models/servicos_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScheduleAddScreen extends StatefulWidget {
  const ScheduleAddScreen({Key? key}) : super(key: key);

  @override
  State<ScheduleAddScreen> createState() => _ScheduleAddScreenState();
}

class _ScheduleAddScreenState extends State<ScheduleAddScreen> {
  final valueList = ['ola', 'oi'];

  final listService = ServicosService();
  final listClients = ClientService();

  late bool isButtonActive = true;

  var valCheck = false;

  List<bool>? isChecked;

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
                    child: DropdownButtonFormField<String>(
                      hint: const Text('Selecionar Cliente'),
                      items: valueList
                          .map((String value) => DropdownMenuItem<String>(
                              value: value, child: Text(value)))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          if (value == value) {
                            isButtonActive = false;
                          } else {
                            value = value;
                          }
                        });
                      },
                    ),
                  ),
                  OutlinedButton(
                    onPressed: isButtonActive
                        ? () {
                            setState(() {
                              isButtonActive = isButtonActive;
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
                height: 300,
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
