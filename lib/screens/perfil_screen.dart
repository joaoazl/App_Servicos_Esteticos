import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PerfilScreen extends StatefulWidget {
  const PerfilScreen({ Key? key }) : super(key: key);

  @override
  State<PerfilScreen> createState() => _PerfilScreenState();
}

class _PerfilScreenState extends State<PerfilScreen> {
  
  String? email = FirebaseAuth.instance.currentUser!.email;
  String? id = FirebaseAuth.instance.currentUser!.uid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 3, 221, 119),
        title: const Text('Meu Perfil'),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(height: 30,),
              const SizedBox(
                height: 200,
                width: 500,
                child: Card(
                  color: Color.fromARGB(255, 197, 198, 199),
                  child: Center(child: Text('Nome')),
                ),
              ),
              const SizedBox(height: 30,),
              ListView(
                shrinkWrap: true,
                children: <Widget>[
                  TextFormField(
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
      ),
    );
  }
}