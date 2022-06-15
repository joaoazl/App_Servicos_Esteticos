import 'package:app/models/client.dart';
import 'package:app/models/client_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ListClientScreen extends StatefulWidget {
  const ListClientScreen({ Key? key }) : super(key: key);

  @override
  State<ListClientScreen> createState() => _ListClientScreenState();
}

class _ListClientScreenState extends State<ListClientScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 3, 221, 119),
        title: const Text('Lista de Clientes'),
        centerTitle: true,
      ),

      body: StreamBuilder<QuerySnapshot>(
        stream: ClientService().getClient(),
        builder: (BuildContext context, snapshot) {
          if(snapshot.hasData){
            List<QueryDocumentSnapshot> docSnap = snapshot.data!.docs;
           return ListView.builder(
             itemBuilder: (context, int index){
               Client client = Client(
                 id: docSnap[index].id,
                 name: docSnap[index].get('name'),
                 dt_nasc: docSnap[index].get('dt_nasc'),
                 email: docSnap[index].get('email'),
                 telefone: docSnap[index].get('telefone')
                );
                print('Cliente: ${client.name}');
               return Container(
               color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 10,
                          child: Column(
                            children: [
                              Text(
                                "" + client.name, style: const TextStyle(fontSize: 20),
                              ),
                              const SizedBox(
                                height: 5,
                              )
                            ],
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                          ),
                        ),
                      ],
                    ),
                  )
             );
             },
             itemCount: docSnap.length,
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
        }
      ),
    );
  }
}