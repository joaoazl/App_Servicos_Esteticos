import 'package:app/models/service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class ServicosService extends ChangeNotifier{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final CollectionReference collectionRef = FirebaseFirestore.instance.collection('services');


  List<Service> allServices = [];

   ServicosService() {
    // _loadAllCommomAreas();
    getDocs();
  }

 String _searchService = '';
 String get search => _searchService;



  set search(String value) {
    _searchService = value;
    notifyListeners();
  }

    Future<DocumentReference> addServices(Service servicos) {
    return collectionRef.add('services');
  }


  add(Service service) {
    var serviceMap = service.toMap();
    _firestore.collection("services").add(serviceMap);
  }

  getService() {
    var employeeCollection = _firestore.collection("services");
    return employeeCollection.snapshots();
  }

  deleteService(String id) {
    DocumentReference docRef = _firestore.collection('services').doc(id);
    docRef
        .delete()
        .whenComplete(() => debugPrint("Dados do $id deletado com sucesso!!"))
        .catchError((erro) => debugPrint("Erro ao deletar o $id -> $erro!!"));
  }

  updateService(Service service) {
    DocumentReference docRef = _firestore.collection('services').doc(service.id);
    docRef
        .update(service.toMap())
        .whenComplete(
            () => debugPrint("Dados do ${service.id} deletado com sucesso!!"))
        .catchError(
            (erro) => debugPrint("Erro ao deletar o ${service.id} -> $erro!!"));
  }

   Stream<QuerySnapshot> getServices() {
    return collectionRef.snapshots();
  }

  Future getDocs() async {
    // QuerySnapshot querySnapshot = await collectionRef.get();
    // for (int i = 0; i < querySnapshot.docs.length; i++) {
    //   allCommomAreas.add(CommomArea.fromSnapshot(querySnapshot.docs[i]));
    //   debugPrint("getDocs ${allCommomAreas[i].id} + ${allCommomAreas[i].area}");
    // }
    QuerySnapshot querySnapshot =
        await _firestore.collection("services").get();

    for (int i = 0; i < querySnapshot.docs.length; i++) {
        allServices.add(Service.fromDocument(querySnapshot.docs[i]));
        debugPrint("getDocs ${allServices[i].id} + ${allServices[i].name}");
    }
    // for (int i = 0; i < allCommomAreas.length; i++) {
    //   debugPrint("getDocs ${allCommomAreas[i].id} + ${allCommomAreas[i].area}");
    // }
  }


   //busca todas as áreas
  Future<void> _loadAllServices() async {
    // debugPrint('Dentro do loadllCommomAreas');
    _firestore
        .collection('services')
        .where('isChecked', isEqualTo: "d")
        .snapshots()
        .listen(
      (snapshot) {
        allServices =
            snapshot.docs.map((c) => Service.fromDocument(c)).toList();
        notifyListeners();
      },
    );
    // debugPrint("Tamanho da lista ${allCommomAreas.length.toString()}");
  }



}
