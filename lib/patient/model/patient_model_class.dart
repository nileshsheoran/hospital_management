class PatientModel {
  String name;
  int id;
  String disease;
  int fees;
  String doctor;
  String address;
  bool gender;

  PatientModel({
    required this.name,
    required this.id,
    required this.disease,
    required this.fees,
    required this.doctor,
    required this.address,
    required this.gender,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'Id': id,
      'disease': disease,
      'fees': fees,
      'doctor': doctor,
      'address': address,
      'gender': gender,
    };
  }

  static PatientModel fromMap(Map<String, dynamic> map) {
    return PatientModel(
      name: map['name'],
      id: map['Id'],
      disease: map['disease'],
      fees: map['fees'],
      doctor: map['doctor'],
      address: map['address'],
      gender: map['gender'],
    );
  }
}
