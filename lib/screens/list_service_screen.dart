import 'package:app/models/service.dart';
import 'package:app/models/servicos_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ListServiceScreen extends StatefulWidget {
  const ListServiceScreen({ Key? key }) : super(key: key);

  @override
  State<ListServiceScreen> createState() => _ListServiceScreenState();
}

class _ListServiceScreenState extends State<ListServiceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 3, 221, 119),
        title: const Text('Lista de Serviços'),
        centerTitle: true,
      ),

      body: StreamBuilder<QuerySnapshot>(
        stream: ServicosService().getService(),
        builder: (BuildContext context, snapshot) {
          if(snapshot.hasData){
            List<QueryDocumentSnapshot> docSnap = snapshot.data!.docs;
           return ListView.builder(
             itemBuilder: (context, int index){
               Service servicos = Service(
                 name: docSnap[index].get('name'),
                 vlr: docSnap[index].get('vlr'), 
                 isChecked: docSnap[index].get('isChecked')
                );
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
                                "" + servicos.name, style: const TextStyle(fontSize: 20),
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