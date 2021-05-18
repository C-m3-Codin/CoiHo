import 'package:coho/Models/Patient.dart';
import 'package:coho/Models/Selected.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Nurse extends StatefulWidget {
  @override
  NurseState createState() {
    return NurseState();
  }
}

class NurseState extends State<Nurse> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController tecSPO2 = TextEditingController();
  final TextEditingController tecBP = TextEditingController();
  final TextEditingController tecTEMP = TextEditingController();
  final TextEditingController tecRESP = TextEditingController();
  final TextEditingController tecPULSE = TextEditingController();
  final TextEditingController namCtrl = TextEditingController();
  final TextEditingController ageCtrl = TextEditingController();

  String _uid, _name, _age, _spo2, _bp, _temp, _resprate, _pulse;
  String asd = " Not setState";
  // Patient patient = Patient();

  bool validateAndSave() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();

      print('$_uid,$_name,$_age,$_spo2,$_bp,$_temp,$_resprate,$_pulse');

      return true;
    } else {
      print("Form invalid");
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    var patients = Provider.of<List<Patient>>(context).toList();
    Selected selected = Provider.of<Selected>(context);
    // String patient = selected.getSelected;

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text("Info Page"),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              //.
              //Bed No.
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 70,
                  width: 350,
                  child: TextFormField(
                    decoration:
                        textInputDecoration.copyWith(labelText: 'Bed No'),
                    validator: (value) =>
                        value.isEmpty ? "  Please Enter Bed No" : null,
                    onChanged: (value) {
                      _uid = value;
                      patients.forEach((element) {
                        print("\n\n\n\n\n\nelement name ${element.name}");
                        if (element.bedNo == _uid.toString()) {
                          asd = "done ";
                          namCtrl.text = element.name;
                          ageCtrl.text = element.age;
                          selected.changeSelect(element);
                        }
                      });
                    },
                    onSaved: (value) {
                      _uid = value;
                      patients.forEach((element) {
                        print("\n\n\n\n\n\nelement name ${element.name}");
                        if (element.bedNo == _uid.toString()) {
                          selected.changeSelect(element);
                          print("\n\n\n\n saved ${element.name}");
                          setState(() {
                            asd = "done ";
                          });
                        }
                      });
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 70,
                  width: 350,
                  child: TextFormField(
                    controller: namCtrl,
                    // onTap: ,
                    // initialValue: asd,

                    //  patient == null ? "" : patient.name,
                    decoration: textInputDecoration.copyWith(labelText: 'Name'),
                    validator: (value) =>
                        value.isEmpty ? "  Please Enter Name" : null,
                    onSaved: (value) {
                      _uid = value;
                    },
                  ),
                ),
              ),

              SizedBox(
                height: 20,
              ),

              //Age

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 70,
                  width: 350,
                  child: TextFormField(
                    controller: ageCtrl,
                    decoration: textInputDecoration.copyWith(labelText: 'Age'),
                    validator: (value) =>
                        value.isEmpty ? "  Please Enter Age" : null,
                    onSaved: (value) => _uid = value,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),

              //Sp02

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      height: 70,
                      width: width * .6,
                      child: TextFormField(
                        controller: tecSPO2,
                        decoration:
                            textInputDecoration.copyWith(labelText: 'SpO2'),
                        validator: (value) =>
                            value.isEmpty ? "  Please Enter Sp02 Level" : null,
                        onSaved: (value) => _uid = value,
                      ),
                    ),
                  ),
                  Container(
                    width: width * .3,
                    child: ElevatedButton(
                        onPressed: () {
                          tecSPO2.text = "NORMAL";
                        },
                        child: Text(
                          "Normal",
                          style: TextStyle(fontSize: 10),
                        )),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),

              //BP

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 70,
                      width: width * .6,
                      child: TextFormField(
                        controller: tecBP,
                        decoration: textInputDecoration.copyWith(
                            labelText: 'Blood Pressure'),
                        validator: (value) => value.isEmpty
                            ? "  Please Enter Blood Pressure"
                            : null,
                        onSaved: (value) => _uid = value,
                      ),
                    ),
                  ),
                  Container(
                    width: width * .3,
                    child: ElevatedButton(
                        onPressed: () {
                          tecBP.text = "NORMAL";
                        },
                        child: Text("Normal")),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),

              //Temperature

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 70,
                      width: width * .6,
                      child: TextFormField(
                        controller: tecTEMP,
                        decoration: textInputDecoration.copyWith(
                            labelText: 'Temperature'),
                        validator: (value) =>
                            value.isEmpty ? "  Please Enter Temperature" : null,
                        onSaved: (value) => _uid = value,
                      ),
                    ),
                  ),
                  Container(
                    width: width * .3,
                    child: ElevatedButton(
                        onPressed: () {
                          tecTEMP.text = "NORMAL";
                        },
                        child: Text("Normal")),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),

              //Respiratory Rate

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 70,
                      width: width * .6,
                      child: TextFormField(
                        controller: tecRESP,
                        decoration: textInputDecoration.copyWith(
                            labelText: 'Respiratory Rate'),
                        validator: (value) => value.isEmpty
                            ? "  Please Enter Respiratory Rate"
                            : null,
                        onSaved: (value) => _uid = value,
                      ),
                    ),
                  ),
                  Container(
                    width: width * .3,
                    child: ElevatedButton(
                        onPressed: () {
                          tecRESP.text = "NORMAL";
                        },
                        child: Text("Normal")),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),

              //Pulse

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 70,
                      width: width * .6,
                      child: TextFormField(
                        controller: tecPULSE,
                        decoration:
                            textInputDecoration.copyWith(labelText: 'Pulse'),
                        validator: (value) =>
                            value.isEmpty ? "  Please Enter Pulse" : null,
                        onSaved: (value) => _uid = value,
                      ),
                    ),
                  ),
                  Container(
                    width: width * .3,
                    child: ElevatedButton(
                        onPressed: () {
                          tecPULSE.text = "NORMAL";
                        },
                        child: Text("Normal")),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(100, 50),
                      padding: EdgeInsets.fromLTRB(60, 20, 60, 20)),
                  onPressed: () {
                    print("\n\n\n\n\nSubmitted here ${selected.patient.name}");
                    validateAndSave();
                  },
                  child: Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

dynamic textInputDecoration = InputDecoration(
  labelStyle: TextStyle(
    color: Colors.blue,
  ),
  fillColor: Colors.white,
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(20),
    borderSide: BorderSide(width: 1, color: Colors.blue),
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(20),
    borderSide: BorderSide(width: 1, color: Colors.black),
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(20),
    borderSide: BorderSide(),
  ),
);
