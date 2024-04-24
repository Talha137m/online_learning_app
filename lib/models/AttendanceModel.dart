class AttendanceModel {
  String attend_id;
  String student_id;
  String classis_id;
  String batch_id;
  String date;
  String attended;
  String attend_time;
  String teacher_id;
  String? leave_note;
  String is_pre_leave;
  String created_at;
  String modified_at;
  String draft;
  String batch_name;
  String stud_first_name;
  String stud_last_name;
  String stud_middle_name;

  AttendanceModel({
    required this.attend_id,
    required this.student_id,
    required this.classis_id,
    required this.batch_id,
    required this.date,
    required this.attended,
    required this.attend_time,
    required this.teacher_id,
    required this.leave_note,
    required this.is_pre_leave,
    required this.created_at,
    required this.modified_at,
    required this.draft,
    required this.batch_name,
    required this.stud_first_name,
    required this.stud_last_name,
    required this.stud_middle_name,
  });

  factory AttendanceModel.fromJson(Map<String, dynamic> json) {
    return AttendanceModel(
      attend_id: json['attend_id'].toString(),
      student_id: json['student_id'].toString(),
      classis_id: json['classis_id'].toString(),
      batch_id: json['batch_id'].toString(),
      date: json['date'].toString(),
      attended: json['attended'].toString(),
      attend_time: json['attend_time'].toString(),
      teacher_id: json['teacher_id'].toString(),
      leave_note: json['leave_note'] as String,
      is_pre_leave: json['is_pre_leave'].toString(),
      created_at: json['created_at'].toString(),
      modified_at: json['modified_at'].toString(),
      draft: json['draft'].toString(),
      batch_name: json['batch_name'].toString(),
      stud_first_name: json['stud_first_name'].toString(),
      stud_last_name: json['stud_last_name'].toString(),
      stud_middle_name: json['stud_middle_name'].toString(),
    );
  }
}
