class BatchModel {
  String batch_id;
  String classis_id;
  String teacher_id;
  String? batch_name;
  String? subject_name;
  String subject_id;
  String? start_time;
  String? end_time;
  String? days;
  String aca_year;
  String? teacher_fullname;
  String? attend_status;

  BatchModel({
    required this.batch_id,
    required this.classis_id,
    required this.teacher_id,
    required this.batch_name,
    required this.subject_name,
    required this.subject_id,
    required this.start_time,
    required this.end_time,
    required this.days,
    required this.aca_year,
    required this.teacher_fullname,
    required this.attend_status,
  });

  factory BatchModel.fromJson(Map<String, dynamic> json) {
    return BatchModel(
      batch_id: json['batch_id'].toString(),
      classis_id: json['classis_id'].toString(),
      teacher_id: json['teacher_id'].toString(),
      batch_name: json['batch_name'] ,
      subject_name: json['subject_name'] ,
      subject_id: json['subject_id'].toString(),
      start_time: json['start_time'] ,
      end_time: json['end_time'] ,
      days: json['days'],
      aca_year: json['aca_year'].toString(),
      teacher_fullname: json['teacher_fullname'],
      attend_status: json['attend_status'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'batch_id': batch_id,
      'classis_id': classis_id,
      'teacher_id': teacher_id,
      'batch_name': batch_name,
      'subject_name': subject_name,
      'subject_id': subject_id,
      'start_time': start_time,
      'end_time': end_time,
      'days': days,
      'aca_year': aca_year,
      'teacher_fullname': teacher_fullname,
      'attend_status': attend_status,
    };
  }
}
