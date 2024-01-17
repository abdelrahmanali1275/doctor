class AddDoctorTimeModel {
  final String day;
  final String from;
  final String to;
  final bool active;
  final String doctorId;

  AddDoctorTimeModel({
    required this.day,
    required this.from,
    required this.to,
    required this.active,
    required this.doctorId,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'day': day,
      'from': from,
      'to': to,
      'active': active,
      'doctorId': doctorId,
    };
  }

  factory AddDoctorTimeModel.fromJson(Map<String, dynamic> json) {
    return AddDoctorTimeModel(
        day: json['day'],
        from: json['from'],
        active: json['active'],
        doctorId: json['doctorId'],
        to: json['to']);
  }
}
