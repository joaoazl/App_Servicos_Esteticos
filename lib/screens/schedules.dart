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

  late bool val = false;

  get onChanged => null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: const Text('Realizar Agendamento'),
        backgroundColor: const Color.fromARGB(255, 3, 201, 108),
        centerTitle: true,
      ),
      body: Center(
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
                  OutlinedButton(
                    onPressed: isButtonActive
                    ? (){
                      setState(() {
                        isButtonActive = isButtonActive;
                      });
                  } : null, 
                  child: const Text('Cadastrar'),),
                ],
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0,20),
                child: Text('Selecionar Serviços', 
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold, 
                  color: Color.fromARGB(255, 3, 201, 108)
                  ),
                ),
              ),
              SizedBox(
                height: 300,
                child: Expanded(
                  flex: 10,
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      return CheckboxListTile(
                        title: Text('Hoje'),
                        value: val, 
                        onChanged: (value){
                          setState(() {
                            val = value!;
                          });
                        }
                      );
                    }, 
                    separatorBuilder: (BuildContext context, int index) { 
                      return const Divider(height: 16,);
                     },
                    itemCount: 16,
                  ),
                ),
              ),
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
                ],
              )
            ],
          ), 
        ),
      ),
    );
  }
}