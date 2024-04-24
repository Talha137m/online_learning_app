class ClassRoomModel {
  String classroom_id;
  String classis_id;
  String aca_year_id;
  String teacher_id;
  String? link;
  String? password;
  String type;
  String meeting_time;
  String meeting_duration;
  String meeting_date;
  String batch_id;
  String? description;
  String? batches;

  ClassRoomModel({
    required this.classroom_id,
    required this.classis_id,
    required this.aca_year_id,
    required this.teacher_id,
    required this.link,
    required this.password,
    required this.type,
    required this.meeting_time,
    required this.meeting_duration,
    required this.meeting_date,
    required this.batch_id,
    required this.description,
    required this.batches,
  });

  factory ClassRoomModel.fromJson(Map<String, dynamic> json) {
    return ClassRoomModel(
      classroom_id: json['classroom_id'].toString(),
      classis_id: json['classis_id'].toString(),
      aca_year_id: json['aca_year_id'].toString(),
      teacher_id: json['teacher_id'].toString(),
      link: json['link'],
      password: json['password'].toString(),
      type: json['type'].toString(),
      meeting_time: json['meeting_time'].toString(),
      meeting_duration: json['meeting_duration'].toString(),
      meeting_date: json['meeting_date'].toString(),
      batch_id: json['batch_id'].toString(),
      description: json['description'],
      batches: json['batches'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'classroom_id': classroom_id,
      'classis_id': classis_id,
      'aca_year_id': aca_year_id,
      'teacher_id': teacher_id,
      'link': link,
      'password': password,
      'type': type,
      'meeting_time': meeting_time,
      'meeting_duration': meeting_duration,
      'meeting_date': meeting_date,
      'batch_id': batch_id,
      'description': description,
      'batches': batches,
    };
  }
}
