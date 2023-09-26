import 'package:Hospital_Management/const/color_const.dart';
import 'package:Hospital_Management/doctor/screen/add_doctor_screen.dart';
import 'package:Hospital_Management/doctor/screen/show_doctor_screen.dart';
import 'package:Hospital_Management/patient/screen/add_patient_screen.dart';
import 'package:Hospital_Management/patient/screen/show_patient_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'HomeScreen',
          ),
          backgroundColor: tittleColor,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const AddPatient();
                    }));
                  },
                  child: const Text('Add Patient'),
                ),
                const SizedBox(
                  height: 18,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const ShowPatient();
                    }));
                  },
                  child: const Text('Show Patient'),
                ),
                const SizedBox(
                  height: 18,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const AddDoctor();
                    }));
                  },
                  child: const Text('Add Doctor'),
                ),
                const SizedBox(
                  height: 18,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const ShowDoctor();
                    }));
                  },
                  child: const Text('Show Doctors'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
