import 'dart:convert';
import 'package:Hospital_Management/const/string_const.dart';
import 'package:Hospital_Management/doctor/modal/doctor_model_class.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
class AddDoctor extends StatefulWidget {
  const AddDoctor({super.key});

  @override
  State<AddDoctor> createState() => _AddDoctorState();
}

class _AddDoctorState extends State<AddDoctor> {
  late TextEditingController nameController;
  late TextEditingController specialistController;
  late TextEditingController feesController;
  late TextEditingController timingController;

  @override
  void initState() {
    nameController = TextEditingController();
    specialistController = TextEditingController();
    feesController = TextEditingController();
    timingController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Doctor Information'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  children: [
                    const Text(
                      'Name',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                        left: 40,
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        controller: nameController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          hintText: 'Enter Name',
                        ),
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
                      'Specialist',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                        left: 15,
                      ),
                    ),
                    Expanded(
                      child: TextField(
                          controller: specialistController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            hintText: 'Enter Specialist',
                          )),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 18,
                ),
                Row(
                  children: [
                    const Text(
                      'Fees',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                        left: 40,
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
                            hintText: 'Enter Fees',
                          )),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 18,
                ),
                Row(
                  children: [
                    const Text(
                      'Timing',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                        left: 25,
                      ),
                    ),
                    Expanded(
                      child: TextField(
                          keyboardType: TextInputType.number,
                          controller: timingController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            hintText: 'Enter Timing',
                          )),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 18,
                ),
                ElevatedButton(
                  onPressed: () async {
                    DoctorModel doctorModel =  DoctorModel(
                      name: nameController.text,
                      specialist: specialistController.text,
                      fees: int.parse(feesController.text.toString(),),
                      timing: int.parse(timingController.text.toString(),),
                    );
                    SharedPreferences sharedPreference = await SharedPreferences
                        .getInstance();
                    String doctor = jsonEncode(doctorModel.toMap(),);
                    List<String> doctorList = sharedPreference.getStringList(
                        doctorRecordKey) ?? [];
                    doctorList.add(doctor);
                    sharedPreference.setStringList(doctorRecordKey, doctorList);
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
        ));
  }
}
