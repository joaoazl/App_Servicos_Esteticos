import 'package:app/models/agendamento.dart';
import 'package:app/models/agendamento_service.dart';
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

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  Agendamento agenda = Agendamento(
    client: Client(name: '', dt_nasc: '', email: '', telefone: ''),
    service: Service(name: '', vlr: '', isChecked: false),
    data: '',
    hora: '',
    observacao: ''
    );

  List<Client> valueList = [
    Client(
      id: null,
      name: 'Nenhum cliente selecionado',
      dt_nasc: '',
      email: '',
      telefone: '',
    )
  ];

  final listService = ServicosService();
  final listClients = ClientService();

  late bool isButtonActive = true;

  var valCheck = false;

  List<bool>? isChecked;

  DateTime selectedDate = DateTime.now();

  get child => null;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(selectedDate.year),
        lastDate: DateTime(2030));
    Localizations.localeOf(context);
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  initState() {
    super.initState();
    listClients.getList().then((value) {
      setState(() {
        valueList.addAll(value.docs
            .map((e) => Client(
                  id: e.id,
                  name: e.get('name'),
                  dt_nasc: e.get('dt_nasc'),
                  email: e.get('email'),
                  telefone: e.get('telefone'),
                ))
            .toList());
      });
    });
    agenda.client = valueList[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        key: scaffoldKey,
        title: const Text('Realizar Agendamento'),
        backgroundColor: const Color.fromARGB(255, 3, 201, 108),
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Center(
              child: Form(
                key: formKey,
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.all(16.0),
                          width: 300.0,
                          child: DropdownButtonFormField<Client>(
                            value: agenda.client,
                            validator: (value){
                              if(value == null){
                                return null;
                              }
                            },
                            items: valueList
                                .map((value) => DropdownMenuItem<Client>(
                                    value: value, child: Text(value.name)))
                                .toList(),
                            onChanged: (value) {
                              setState(() {
                                agenda.client = value!;
                                isButtonActive = value.id == null;
                              });
                            },
                          ),
                        ),
                        OutlinedButton(
                          onPressed: isButtonActive
                              ? () {
                                  setState(() {
                                    Navigator.of(context)
                                        .pushNamed('/registerClients');
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
                      height: 200,
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
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Container(
                            width: 170,
                            child: TextFormField(
                              validator: (data) {
                                if (data!.isEmpty) {
                                  return 'Campo obrigatorio!!!';
                                }
                                return null;
                              },
                              onSaved: (data) => agenda.data = data!,
                              decoration: const InputDecoration(
                                label: Text('Data'),
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(
                                              255, 134, 134, 134)))),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 170,
                            child: TextFormField(
                              validator: (hora) {
                                if (hora!.isEmpty) {
                                   return 'Campo obrigatorio!!!';
                                  }
                                  return null;
                                },
                                onSaved:(hora) => agenda.hora = hora!,
                              decoration: const InputDecoration(
                                label: Text('Horário'),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color.fromARGB(
                                      255, 134, 134, 134)
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        height: 100,
                        child: TextFormField(
                          onSaved: (observacao) => agenda.observacao = observacao!,
                          decoration: InputDecoration(
                            hintText: 'Informe alguma observação...',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          minLines: 6,
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 300,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: const Color.fromARGB(255, 3, 221, 119),
                            padding: const EdgeInsets.all(10),
                          ),
                        onPressed: () {
                           formKey.currentState!.save();
                          if(context.read<ServicosService>().allServices.any((service) => service.isChecked == true)){
                            AgendamentoService agendaService = AgendamentoService();
                            agendaService.add(agenda);
                          }else{
                            return null;
                          };
                        },
                        child: const Text(
                          'Agendar',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
