import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';


class CovidList extends StatefulWidget {
  @override
  _CovidListState createState() => _CovidListState();
}

class _CovidListState extends State<CovidList> {
  @override
  Widget build(BuildContext context) {

    final covidData = Provider.of<QuerySnapshot>(context);
//    print(covidData.documents);
    for(var doc in covidData.documents){
      print(doc.data);
    }

    return Container(

    );
  }
}
