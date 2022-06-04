import 'package:app/models/servicos_service.dart';
import 'package:app/screens/option_clients_screen.dart';
import 'package:app/screens/login/login_screen.dart';
import 'package:app/screens/option_services_screen.dart';
import 'package:app/screens/register_clients.dart';
import 'package:app/screens/register_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import "package:provider/provider.dart";

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();

  runApp(
    
    const MyApp(),

  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [

        ChangeNotifierProvider(
          //cria um objeto e o disponibiliza para este e os seus descententes
          create: (_) => ServicosService(),
          /*Lazy: a classe UserManager() ainda não foi utilizada,
          portanto ele determina a instanciação imediata */
          lazy:true, 
        ),

      ],
      child: MaterialApp(
        title: 'Flutter - Serviços Estéticos',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/login',
        routes: {
          '/login':(context) => const LoginScreen(),
          '/optClients':(context) => const OptionClientsScreen(),
          '/registerClients': (context) => ClientAddScreen(),
          '/optServices': (context) => const OptionServicesScreen(),
          '/registerService':(context) => ServiceAddScreen(),
        },
      ),
    );
  }
}