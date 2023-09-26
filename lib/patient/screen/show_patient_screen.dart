import 'dart:convert';

import 'package:Hospital_Management/const/color_const.dart';
import 'package:Hospital_Management/const/string_const.dart';
import 'package:Hospital_Management/patient/model/patient_model_class.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShowPatient extends StatefulWidget {
  const ShowPatient({super.key});

  @override
  State<ShowPatient> createState() => _ShowPatientState();
}

class _ShowPatientState extends State<ShowPatient> {
  late List<PatientModel> patientList;
  bool gender = true;

  @override
  void initState() {
    patientList = [];
    getPatientList();
    super.initState();
  }

  Future<void> getPatientList() async {
    patientList.clear();
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    List<String> pasent =
        sharedPreferences.getStringList(patientRecordKey) ?? [];
    for (int i = 0; i < pasent.length; i++) {
      String pasentList = pasent[i];

      Map<String, dynamic> map = jsonDecode(pasentList);
      PatientModel patientModel = PatientModel.fromMap(map);
      patientList.add(patientModel);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: tittleColor,
        ),
        body: ListView.builder(
          itemCount: (patientList.length),
          itemBuilder: (context, index) {
            PatientModel patientModel = patientList[index];
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Text(
                        'Name',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(
                        width: 80,
                      ),
                      Text(
                        patientModel.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        'Id',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(
                        width: 120,
                      ),
                      Text(
                        patientModel.id.toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        'Disease',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(
                        width: 60,
                      ),
                      Text(
                        patientModel.disease,
                        style: const TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        'Fees',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(
                        width: 90,
                      ),
                      Text(
                        patientModel.fees.toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        'Doctor',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        width: 70,
                      ),
                      Text(
                        patientModel.doctor,
                        style: const TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 80,
                  ),
                  Row(
                    children: [
                      const Text(
                        'Address',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        width: 70,
                      ),
                      Text(
                        patientModel.address,
                        style: const TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  Text('gender=$gender'),
                  const Divider(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
