import 'package:app/models/client_service.dart';
import 'package:app/models/service.dart';
import 'package:app/models/servicos_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ScheduleAddScreen extends StatefulWidget {
  const ScheduleAddScreen({ Key? key }) : super(key: key);

  @override
  State<ScheduleAddScreen> createState() => _ScheduleAddScreenState();
}

class _ScheduleAddScreenState extends State<ScheduleAddScreen> {


  final valueList = ['ola', 'oi'];

  final listService = ServicosService();
  final listClients = ClientService();

  late bool isButtonActive = true;
  
  var valCheck = false;
  late List<bool> isChecked;

  get onChanged => null;
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
          child:Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(16.0),
                    width: 300.0,
                    child: DropdownButtonFormField<String>(
                      hint: const Text('Selecionar Cliente'),
                      items: valueList.map((String value) => 
                      DropdownMenuItem<String>(
                        value: value,
                        child: Text(value)
                      )
                    ).toList(), 
                      onChanged: (value){
                        setState(() {
                          if (value == value){
                            isButtonActive = false;
                          }else{
                          value = value;
                          }
                        });
                      } ,
                    ),
                  ),
                  OutlinedButton(
                    onPressed: isButtonActive
                    ? (){
                      setState(() {
                        isButtonActive = isButtonActive;
                      });
                  } : null, 
                  child: const Text('Cadastrar'),),
                ],
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0,20),
                child: Text('Selecionar Serviços', 
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold, 
                  color: Color.fromARGB(255, 3, 201, 108)
                  ),
                ),
              ),
              SizedBox(
                height: 300,
                child: Expanded(
                  flex: 10,
                  child: StreamBuilder<QuerySnapshot>(
                    stream: listService.getService(),
                    builder: (context, snapshot) {
                      if(snapshot.hasData){
                        var valorDocs = snapshot.data!.docs;
                        return ListView.separated(
                        itemBuilder: (context, index) {
                          return CheckboxListTile(
                            title: Text(valorDocs[index].get('name')),
                            value: valCheck, 
                            focusNode: ,
                            onChanged: (value){
                              setState(() {
                                valCheck = value!;
                              });
                            }
                          );
                        }, 
                        separatorBuilder: (BuildContext context, int index) { 
                          return const Divider(height: 16,);
                         },
                        itemCount: valorDocs.length,
                      );

                      }
                      return const Text('Dados não encontrados');
                    }
                  ),
                ),
              ),
            ],
          ), 
        ),
      ),
    );
  }
}