import 'package:app/screens/list_item.dart';
import 'package:flutter/material.dart';

class OptionClientsScreen extends StatefulWidget {
  const OptionClientsScreen({ Key? key }) : super(key: key);

  @override
  State<OptionClientsScreen> createState() => _OptionClientsScreenState();
}

class _OptionClientsScreenState extends State<OptionClientsScreen> {

  final List<ListItem> _listItem = 
  [
    ListItem(
    title: 'Cadastrar', 
    event: (context){
      Navigator.of(context).pushNamed('/registerClients');
    },
    ),

    ListItem(
      title: 'Listar', 
      event: (context){
        Navigator.of(context).pushNamed('/listClients');
      },
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 3, 221, 119),
        title: const Text('Cliente'),
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