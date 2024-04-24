class ExamResultModel {
  String exam_subject_id;
  String exam_id;
  String? subject;
  String? total_marks;
  String? passing_marks;
  String? obtain_marks;
  String? is_absent;

  ExamResultModel({
    required this.exam_subject_id,
    required this.exam_id,
    required this.subject,
    required this.total_marks,
    required this.passing_marks,
    required this.obtain_marks,
    required this.is_absent,
  });

  factory ExamResultModel.fromJson(Map<String, dynamic> json) {
    return ExamResultModel(
      exam_subject_id: json['exam_subject_id'].toString(),
      exam_id: json['exam_id'].toString(),
      subject: json['subject'] as String,
      total_marks: json['total_marks'] as String,
      passing_marks: json['passing_marks'] as String,
      obtain_marks: json['obtain_marks'] as String,
      is_absent: json['is_absent'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'exam_subject_id': exam_subject_id,
      'exam_id': exam_id,
      'subject': subject,
      'total_marks': total_marks,
      'passing_marks': passing_marks,
      'obtain_marks': obtain_marks,
      'is_absent': is_absent,
    };
  }
}
