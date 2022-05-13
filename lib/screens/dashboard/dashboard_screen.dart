import 'package:app/screens/dashboard/itens_dashboard.dart';
import 'package:flutter/material.dart';

class DashBoardScreen extends StatelessWidget {
  DashBoardScreen({Key? key}) : super(key: key);

  ItensDashboard item1 = ItensDashboard(
      event: '0',
      image: './assets/images/home.png',
      subtitle: "Casas dos Moradores",
      title: "Unidades");

  ItensDashboard item2 = ItensDashboard(
      event: '0',
      image: './assets/images/food.png',
      subtitle: "",
      title: "Food");
  ItensDashboard item3 = ItensDashboard(
      event: '0',
      image: './assets/images/persons.png',
      subtitle: "Casas dos Moradores",
      title: "Úsuarios");

  @override
  Widget build(BuildContext context) {
    List<ItensDashboard> myList = [
      item1,
      item2,
      item3,
    ];
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          alignment: Alignment.topCenter,
          child: SizedBox(
            width: 400,
            child: GridView.builder(
              itemCount: myList.length,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 1,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  child: Container(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: Colors.deepPurple.shade400,
                    ),
                    child: Column(children: [
                      Image.asset(myList[index].image!),
                      Text(myList[index].title!),
                    ]),
                  ),
                  onTap: () => callOwner(context, index),
                );
              },
              shrinkWrap: true,
            ),
          ),
        ),
      ),
    );
  }

  callOwner(BuildContext context, int index) {
    var routeOrganizer = {
      1: '/ownerAdd',
      2: '/ownerList',
    };
    if (index == 1) {
      Navigator.of(context).pushNamed('/ownerAdd');
    }

    if (index == 2) {
      Navigator.of(context).pushNamed('/ownerList');
    }
  }
}