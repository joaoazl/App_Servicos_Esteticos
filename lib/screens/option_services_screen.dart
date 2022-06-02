import 'package:app/screens/register_service.dart';
import 'package:flutter/material.dart';

import 'list_item.dart';

class OptionServicesScreen extends StatefulWidget {
  const OptionServicesScreen({ Key? key }) : super(key: key);

  @override
  State<OptionServicesScreen> createState() => _OptionServicesScreenState();
}

class _OptionServicesScreenState extends State<OptionServicesScreen> {

  final List<ListItem> _listItem = 
  [
    ListItem(
    title: 'Cadastrar', 
    event: (context){
      Navigator.of(context).pushNamed('/registerService');
    },
    ),

    ListItem(
      title: 'Listar', 
      event: (context){

      },
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 3, 221, 119),
        title: const Text('Serviços'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
      child: ListView.separated(
        itemBuilder: (
          (BuildContext context, int index){
            var item = _listItem[index];
            return GestureDetector(
              child: Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              item.title, style: const TextStyle(fontSize: 20),
                            ),
                            const SizedBox(
                              height: 5,
                            )
                          ],
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                        )
                      )
                    ],
                  ),
                ),
              ),
              onTap: (){
                item.event(context);
              },
            );
          }
        ), 
        separatorBuilder: (context, index){
          return const Divider(
            height: 1,
            color: Colors.black,
          );
        }, itemCount: _listItem.length),
      ),
    );
  }
}