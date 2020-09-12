import 'package:brew_crew/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:brew_crew/services/database.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';


class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();

}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();

  DateTime _datetime;
  String _caseno = "";
  String _patientcodeOrhospitalreg = "";
  String _wordNo="";
  String _bedNo="";
  String _name = "";
  DateTime _dateOfBirth;
  String _age = "";
  String _gender = "Male";
  String _address_division="";
  String _address_district="";
  String _address_union="";
  String _address_ward_no="";
  String _address_house_no="";
  String _address_road_no="";
  String _address_occupation="";
  String _address_contact_no="";
  int _spo2percentage =0;
  int _resp_rate = 0;
  int _temp_axillary = 0;
  int _heart_rate = 0;
  int _bp_l = 0;
  int _bp_h = 0;
  String _risk_factor_co_morbidities = "";
  var _risk_factor_co_morbidities_list = [];
  String _rt_PCR = "Negative";
  String _date_of_sameple_collection = "";
  String _date_of_result = "";
  int _oxygen_therapy_rec_amount = 0;
  int _total_oxygen = 0;
  String _methyl_prednisolone = "";
  var _antibiotics_list = [];
  var _antiviral_list = [];
  String _oxygen_therapy_duration_hrs_days = "";
  String _mech_vent_duration_hrs_days = "";
  DateTime _date_of_discharge;
  String _outcome="";
  int _total_length_of_hospital_stays = 0;
  DateTime _last_date_of_leaving_hospital;





  List<int> top = [];
  List<int> bottom = [0];
  @override
  Widget build(BuildContext context) {
    const Key centerKey = ValueKey('bottom-sliver-list');
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: Text('BDClinical Research'),
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
              onPressed: () async {
                await _auth.signOut();
              },
              icon: Icon(Icons.person),
              label: Text('logout'))
        ],
      ),
      body: CustomScrollView(
        center: centerKey,
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.blue[200 + top[index] % 4 * 100],
                  height: 100 + top[index] % 4 * 20.0,
                  child: Text('Item: ${top[index]}'),
                );
              },
              childCount: top.length,
            ),
          ),
          SliverList(
            key: centerKey,
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return Container(
//                  alignment: Alignment.center,
                  //color: Colors.blue[200 + bottom[index] % 4 * 100],
//                  height: 100 + bottom[index] % 4 * 20.0,
                  padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),

                  child: Column(
                    children: [
                      Text(
                        'Data retrieved from patient record'
                      ),
                      Text(
                          'COVID-19 CRF'
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: 'Case No'
                        ),
                        onChanged: (val){
                          setState(() {
                            _caseno = val;
                          });
                        },
                      ),
                      Text(_datetime == null ? 'Select Date' : DateFormat('dd MM yyyy').format(_datetime)),
                      RaisedButton(
                        child: Text('Date of Entry'),
                        onPressed: (){
                          showDatePicker(
                              context: context,
                              initialDate: _datetime == null ? DateTime.now() : _datetime,
                              firstDate: DateTime(2019),
                              lastDate: DateTime(2050)).then((value) {
                                setState(() {
                                  _datetime = value;
                                });
                          });
                        },
                        
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: 'Patient code number/Hospital registration number'
                        ),
                        onChanged: (val){
                          setState(() {
                            _patientcodeOrhospitalreg = val;
                          });
                        },
                      ),

                    ],
                  ),
                );
              },
              childCount: bottom.length,
            ),
          ),
        ],
      ),

    );
  }

}



//
//
//return Scaffold(
//      backgroundColor: Colors.brown[50],
//      appBar: AppBar(
//        title: Text('BDClinical Research'),
//        backgroundColor: Colors.brown[400],
//        elevation: 0.0,
//        actions: <Widget>[
//          FlatButton.icon(
//              onPressed: () async {
//                await _auth.signOut();
//              },
//              icon: Icon(Icons.person),
//              label: Text('logout'))
//        ],
//      ),
//
//      body: CustomScrollView(
//        slivers: <Widget>[
//          const SliverAppBar(
//            pinned: true,
//            expandedHeight: 250.0,
//            flexibleSpace: FlexibleSpaceBar(
//              title: Text('Patient Data'),
//            ),
//          ),
//          SliverGrid(
//            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
//              maxCrossAxisExtent: 200.0,
//              mainAxisSpacing: 10.0,
//              crossAxisSpacing: 10.0,
//              childAspectRatio: 4.0,
//            ),
//            delegate: SliverChildBuilderDelegate(
//                  (BuildContext context, int index) {
//                return Container(
//                  alignment: Alignment.center,
//                  color: Colors.teal[100],
//                  child: Text('Grid Item $index'),
//                );
//              },
//              childCount: 30,
//            ),
//          ),
//          SliverFixedExtentList(
//            itemExtent: 50.0,
//            delegate: SliverChildBuilderDelegate(
//                  (BuildContext context, int index) {
//                return Container(
//                  alignment: Alignment.center,
//                  color: Colors.lightBlue[100 * (index % 9)],
//                  child: Text('List Item $index'),
//                );
//              },
//            ),
//          ),
//        ],
//      )
//    );
//
