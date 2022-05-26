import 'package:app/models/client.dart';
import 'package:app/screens/schedules.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget{

  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  late final Client client;

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
            child: ListView.separated(
              padding: const EdgeInsets.all(10.0),
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int cliente){
              return const ListTile(
                title: Text("Hoje"),
                trailing: Icon(Icons.chevron_right_outlined),
              );
            }, separatorBuilder: (context, index){
              return const Divider(height: 16,);
            }, itemCount: 16),
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