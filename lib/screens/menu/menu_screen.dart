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
    'Pagamentos', 
    '', 
    'assets/images/clientes.png'
  );

  ItemMenuScreen item3 = ItemMenuScreen(
    'Serviços', 
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

    return Container(
      child: GridView.builder(
        itemCount: myList.length,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 1,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ), 
        itemBuilder: (BuildContext ctx, index){
          return Container(
            child: Column(
              children: [
                Image.asset(myList[index].image),
                Text(myList[index].title),
              ]
            ),
          );
        },
      ),
    );
  }
}