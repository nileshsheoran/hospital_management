import 'dart:convert';
import 'package:Hospital_Management/const/string_const.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:Hospital_Management/patient/model/patient_model_class.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddPatient extends StatefulWidget {
  const AddPatient({super.key});

  @override
  State<AddPatient> createState() => _AddPatientState();
}

class _AddPatientState extends State<AddPatient> {
  late TextEditingController nameController;
  late TextEditingController idController;
  late TextEditingController diseaseController;
  late TextEditingController feesController;
  late TextEditingController doctorController;
  late TextEditingController addressController;


bool gender=true;

  @override
  void initState() {
    nameController = TextEditingController();
    idController = TextEditingController();
    diseaseController = TextEditingController();
    feesController = TextEditingController();
    doctorController = TextEditingController();
    addressController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Patient Information'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  children: [
                    const Text(
                      ' Name',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                        left: 30,
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        controller: nameController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            hintText: 'Enter Name'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 18,
                ),
                const SizedBox(
                  width: 18,
                ),
                Row(
                  children: [
                    const Text(
                      ' Id',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                        left: 55,
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        keyboardType: TextInputType.number,
                        controller: idController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            hintText: 'Enter id'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 18,
                ),
                const SizedBox(
                  width: 18,
                ),
                Row(
                  children: [
                    const Text(
                      ' Disease',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                        left: 20,
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        controller: diseaseController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            hintText: 'Enter Disease'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 18,
                ),
                Row(
                  children: [
                    const Text(
                      ' Fees',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                        left: 45,
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        keyboardType: TextInputType.number,
                        controller: feesController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            hintText: 'Enter Fees'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 18,
                ),
                Row(
                  children: [
                    const Text(
                      ' Doctor',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                        left: 35,
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        controller: doctorController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            hintText: 'Enter Doctor'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 18,
                ),
                Row(
                  children: [
                    const Text(
                      ' Address',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                        left: 45,
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        controller: addressController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            hintText: 'Enter Address'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 18,
                ),
                Row(
                  children: [
                    const Text(
                      'Gender',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                    Switch(
                      onChanged: (bool value) {

                        setState(() {
                          gender = value;
                        });
                      },
                      value: gender,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 18,
                ),
                ElevatedButton(
                  onPressed: () async {
                    PatientModel patient = PatientModel(
                      name: nameController.text,
                      id: int.parse(idController.text.toString()),
                      disease: diseaseController.text,
                      fees: int.parse(feesController.text.toString()),
                      doctor: doctorController.text,
                      address: addressController.text,
                      gender: gender,
                    );
                    SharedPreferences sharedPreference =
                        await SharedPreferences.getInstance();
                    String patint = jsonEncode(patient.toMap());

                    List<String> patientList =
                        sharedPreference.getStringList(patientRecordKey) ?? [];
                    patientList.add(patint);
                    sharedPreference.setStringList(
                       patientRecordKey, patientList);
                    Fluttertoast.showToast(
                        msg: "Saved Successfully",

                    );
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Add'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
