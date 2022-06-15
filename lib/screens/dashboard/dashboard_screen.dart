import 'package:app/models/agendamento.dart';
import 'package:app/models/agendamento_service.dart';
import 'package:app/models/client.dart';
import 'package:app/models/client_service.dart';
import 'package:app/models/service.dart';
import 'package:app/screens/schedules.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget{

  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  get title => null;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 3, 201, 108),
        leading: GestureDetector(
          onTap: (){
           
          },
          child: const Icon(
            Icons.notifications,
            size: 34.0,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 42,
            margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
                border: Border.all(color: Colors.black26)
              ),
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: const TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.search),
                  border: InputBorder.none,
                ),
              ), 
          ),
          const SizedBox(height: 20.0,),
          const Text("Agendamentos", style: TextStyle(color: Color.fromARGB(255, 3, 221, 119), fontSize: 20),),
          Expanded(
            flex: 10,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: StreamBuilder<QuerySnapshot>(
                stream: AgendamentoService().getAgendamento(),
                builder: (BuildContext context, snapshot){
                  if(snapshot.hasData){
                  List<QueryDocumentSnapshot> docSnap = snapshot.data!.docs;

                  return ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index){
                      var agenda = Agendamento(
                      //client: (docSnap[index].get('id_client').map((client) => Client.fromMap(client))),
                      services: (docSnap[index].get('services') as List).map((service) => Service.fromMap(service)).toList(),
                      data: (docSnap[index].get('data')),
                      hora: (docSnap[index].get('hora')),
                      observacao: (docSnap[index].get('observacao'))
                      );
                      print('Data: ${agenda.data}');
                      print('cliente: ${agenda.client}');

                      return FutureBuilder<DocumentSnapshot>(
                        future: ClientService().getClientById(docSnap[index].get('id_client')),
                        builder: (BuildContext context, snapshot){
                          if(snapshot.hasData){
                            Client client = Client(
                              id: snapshot.data!.id,
                              name: snapshot.data!.get('name'),
                              dt_nasc: snapshot.data!.get('dt_nasc'),
                              email: snapshot.data!.get('email'),
                              telefone: snapshot.data!.get('telefone')
                              );
                            return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color.fromARGB(255, 214, 214, 214)),
                          height: 270,
                          margin: const EdgeInsets.only(bottom: 10),
                          child: Column(
                            children: [
                              ListTile(
                                title: Text('${agenda.data}'),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(client.name),
                              ),
                              Expanded(
                                flex: 10,
                                child: ListView.builder(
                                  itemBuilder: (BuildContext context, int index){
                                    return Column(
                                      children: [
                                        Text('${agenda.services[index].name}')
                                      ],
                                    );
                                  },
                                  itemCount: agenda.services.length,
                                ),
                              ),
                              const SizedBox(height: 50,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                
                                children: <Widget>[
                                  OutlinedButton(
                                    onPressed: (){}, 
                                    child: const Text('Cancelar agenda')
                                  ),
                                  OutlinedButton(
                                    onPressed: (){}, 
                                    child: const Text('Finalizar agenda')
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                          }else if(snapshot.connectionState == ConnectionState.done){
                            return ListView(
                            children: const [
                              Align(
                                alignment: AlignmentDirectional.center,
                                child: Text('Não há Dados!'),
                              )
                              ],
                            );
                            }else{
                              return const Center(
                                child: CircularProgressIndicator()
                              );
                            }
                        },
                      );
                    },
                      itemCount: docSnap.length);
                    }else if(snapshot.connectionState == ConnectionState.done){
                      return ListView(
                        children: const [
                          Align(
                            alignment: AlignmentDirectional.center,
                            child: Text('Não há Dados!'),
                          )
                        ],
                      );
                    }else{
                      return const Center(
                        child: CircularProgressIndicator()
                      );
                  }
                }
              ),
            ),
          )
        ],
      ),

      floatingActionButton: FloatingActionButton.extended(
            backgroundColor: const Color.fromARGB(255, 3, 221, 119),
            foregroundColor: Colors.black,
            elevation: 4.0,
            onPressed: () {
    // Respond to button press
            Navigator.push(
              context, MaterialPageRoute(
                builder: (context) => const ScheduleAddScreen(),
              )
            );
          },
            label: const Text('Agendar'),
            icon: const Icon(Icons.schedule),
      )
    );
  }
}