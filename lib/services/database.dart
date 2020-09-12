import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{
  final CollectionReference covidCollection = Firestore.instance.collection('covid data');

  Future updateUserData(String sugers, String name, int strength) async {
    return await covidCollection.document().setData({
      'sugars':sugers,
      'name':name,
      'strength': strength
    });
  }
  Stream<QuerySnapshot> get covidData{
    return covidCollection.snapshots();
  }
}

