import 'package:flutter/material.dart';

class ScheduleAddScreen extends StatefulWidget {
  const ScheduleAddScreen({ Key? key }) : super(key: key);

  @override
  State<ScheduleAddScreen> createState() => _ScheduleAddScreenState();
}

class _ScheduleAddScreenState extends State<ScheduleAddScreen> {
  List<String> valueList = ['a', 'b'];
  List<String> serviceList = ['Limpeza de Pele', 'Micropigmentação'];

  late bool isButtonActive = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: const Text('Realizar Agendamento'),
        backgroundColor: const Color.fromARGB(255, 3, 201, 108),
        centerTitle: true,
      ),
      body: Center(
        child: Card(
          child: Form(
            child:Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(16.0),
                      width: 300.0,
                      child: DropdownButtonFormField<String>(
                        hint: const Text('Selecionar Cliente'),
                        items: valueList.map((String value) => 
                        DropdownMenuItem<String>(
                          value: value,
                          child: Text(value)
                        )
                      ).toList(), 
                        onChanged: (value){
                          setState(() {
                            if (value == value){
                              isButtonActive = false;
                            }else{
                            value = value;
                            }
                          });
                        } ,
                      ),
                    ),
                    OutlinedButton(onPressed: isButtonActive
                      ? (){
                        setState(() {
                          isButtonActive = isButtonActive;
                        });
                    } : null, 
                    child: const Text('Cadastrar'),)
                  ],
                ),

                Row(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(16.0),
                      width: 400.0,
                      child: DropdownButtonFormField<String>(
                        hint: const Text('Selecionar Serviço'),
                        items: serviceList.map((String value) => 
                        DropdownMenuItem<String>(
                          value: value,
                          child: Text(value)
                        )
                      ).toList(), 
                        onChanged: (value){
                          setState(() {
                            if (value == value){
                              isButtonActive = false;
                            }else{
                            value = value;
                            }
                          });
                        } ,
                      ),
                    ),
                  ],
                )

              ],
            ), 
          ),
        ),
      ),
    );
  }
}