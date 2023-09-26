class DoctorModel {
  String name;
  String specialist;
  int fees;
  int timing;

  DoctorModel(
      {required this.name,
      required this.specialist,
      required this.fees,
      required this.timing});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'specialist': specialist,
      'fees': fees,
      'timing': timing,
    };
  }

  static DoctorModel fromMap(Map<String, dynamic> map) {
    return DoctorModel(
      name: map['name'],
      specialist: map['specialist'],
      fees: map['fees'],
      timing: map['timing'],
    );
  }
}
