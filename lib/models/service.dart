import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class Service extends ChangeNotifier{
  late String? id;
  late String name;
  late String vlr;
  bool? isChecked;

  Service({this.id, required this.name,required this.vlr,required this.isChecked,});

  //método construtor para salvar os dados do documento firebase
  Service.fromDocument(DocumentSnapshot document) {
    id = document.id;
    name = document['name'] as String;
    vlr = document['vlr'] as String;
    //vem do firebase uma lista dinâmica que será convertida em string localmente
    isChecked = document['isChecked'] as bool;
  }

  Service clone(){
    return Service(
      name: name, 
      vlr: vlr, 
      isChecked: isChecked
      );

  }

  Service.fromMap(Map<String, dynamic> map)
      :
        name = map['name'],
        vlr = map['vlr'],
        isChecked = map['isChecked'];

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'vlr': vlr,
      'isChecked': isChecked
    };
  }
}