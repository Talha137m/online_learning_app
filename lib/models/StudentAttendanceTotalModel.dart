class StudentAttendanceTotalModel {
  String student_id;
  String stud_first_name;
  String stud_last_name;
  String stud_middle_name;
  String total_attended;
  String total_absent;
  String total_leave;

  StudentAttendanceTotalModel({
    required this.student_id,
    required this.stud_first_name,
    required this.stud_last_name,
    required this.stud_middle_name,
    required this.total_attended,
    required this.total_absent,
    required this.total_leave,
  });

  factory StudentAttendanceTotalModel.fromJson(Map<String, dynamic> json) {
    return StudentAttendanceTotalModel(
      student_id: json['student_id'].toString(),
      stud_first_name: json['stud_first_name'].toString(),
      stud_last_name: json['stud_last_name'].toString(),
      stud_middle_name: json['stud_middle_name'].toString(),
      total_attended: json['total_attended'].toString(),
      total_absent: json['total_absent'].toString(),
      total_leave: json['total_leave'].toString(),
    );
  }
}
