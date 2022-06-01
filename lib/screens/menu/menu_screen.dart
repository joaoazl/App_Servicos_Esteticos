import 'package:app/screens/menu/item_screem.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  MenuScreen({ Key? key }) : super(key: key);

  ItemMenuScreen item1 = ItemMenuScreen(
    'Clientes', 
    '', 
    'assets/images/clientes.png'
  );

  ItemMenuScreen item2 = ItemMenuScreen(
    'Serviços', 
    '', 
    'assets/images/clientes.png'
  );

  ItemMenuScreen item3 = ItemMenuScreen(
    'Pagamentos', 
    '', 
    'assets/images/clientes.png'
  );

  ItemMenuScreen item4 = ItemMenuScreen(
    'Fidelizar', 
    '', 
    'assets/images/clientes.png'
  );

  @override
  Widget build(BuildContext context) {

     List<ItemMenuScreen> myList = [item1, item2, item3, item4];

    return Padding(
      padding: const EdgeInsets.all(18),
      child: GridView.builder(
        itemCount: myList.length,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 1,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ), 
        itemBuilder: (BuildContext ctx, index){
          return GestureDetector(
            onTap: () =>callOwner(ctx, index),
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 3, 201, 108),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  Image.asset(myList[index].image, width: 120),
                  Text(myList[index].title, style: const TextStyle(fontWeight: FontWeight.bold)),
                ]
              ),
            ),
          );
        },
      ),
    );
  }

  callOwner(BuildContext context, int index){
    if(index == 0){
      Navigator.of(context).pushNamed('/optClients');
    }
    if(index == 1){
      Navigator.of(context).pushNamed('/optServices');
    }
  }
}