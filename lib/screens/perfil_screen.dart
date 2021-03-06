import 'package:app/models/user/user_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PerfilScreen extends StatefulWidget {
  const PerfilScreen({ Key? key }) : super(key: key);

  @override
  State<PerfilScreen> createState() => _PerfilScreenState();
}

class _PerfilScreenState extends State<PerfilScreen> {

  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 3, 221, 119),
        title: const Text('Meu Perfil'),
      ),
      body: Consumer<UserServices>(
        builder:(_, userServices,__){
          _emailController.text = userServices.userLocal?.email ?? '';
          return Container(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        const SizedBox(height: 30,),
                         SizedBox(
                          height: 200,
                          width: 500,
                          child: Card(
                            color: const Color.fromARGB(255, 197, 198, 199),
                            child: Center(child: Text("Olá, ${userServices.userLocal?.name}",
                            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                            )
                            ),
                          ),
                        ),
                        const SizedBox(height: 30,),
                        ListView(
                          shrinkWrap: true,
                          children: <Widget>[
                            TextFormField(
                              controller: _emailController,
                              enabled: false,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 30,),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.start,
                           children: [
                             SizedBox(
                               height: 50,
                               width: 100,
                               child: ElevatedButton(
                                style: ElevatedButton.styleFrom(primary: const Color.fromARGB(255, 236, 22, 22)),
                                onPressed: () {
                                  
                                },
                                child: const Text(
                                  'Sair',
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                        ),
                             ),
                           ],
                         ),
                      ],
                    ),
                  ),
                );

        }
      ),
    );
  }
}