import 'dart:convert';

import 'package:Hospital_Management/const/color_const.dart';
import 'package:Hospital_Management/const/string_const.dart';
import 'package:Hospital_Management/doctor/modal/doctor_model_class.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShowDoctor extends StatefulWidget {
  const ShowDoctor({super.key});

  @override
  State<ShowDoctor> createState() => _ShowDoctorState();
}

class _ShowDoctorState extends State<ShowDoctor> {
  late List<DoctorModel> doctorList;

  @override
  void initState() {
    doctorList = [];
    getDoctorModel();
    super.initState();
  }

  Future<void> getDoctorModel() async {
    doctorList.clear();
    SharedPreferences sharedPerference = await SharedPreferences.getInstance();
    List<String> dr = sharedPerference.getStringList(doctorRecordKey) ?? [];
    for (int i = 0; i < dr.length; i++) {
      String doctr = dr[i];
      Map<String, dynamic> map = jsonDecode(doctr);
      DoctorModel doctor = DoctorModel.fromMap(map);
      doctorList.add(doctor);
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
            itemCount: (doctorList.length),
            itemBuilder: (context, index) {
              DoctorModel doctorModel = doctorList[index];
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
                          doctorModel.name,
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
                          'Specialist',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                        Text(
                          doctorModel.specialist,
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
                          width: 80,
                        ),
                        Text(
                          doctorModel.fees.toString(),
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
                          'Timing',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(
                          width: 80,
                        ),
                        Text(
                          doctorModel.timing.toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    const Divider(),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
