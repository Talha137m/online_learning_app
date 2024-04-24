class AssignmentModel {
  String assign_id;
  String batch_id;
  String classis_id;
  String? assign_title;
  String? assign_description;
  String assign_end_of_submission_date;
  String teacher_id;
  String created_at;
  String modified_at;
  String draft;
  String attachment_id;
  String type;
  String type_id;
  String file;
  String file_type;
  String file_size;
  String subject_id;
  String? batch_name;
  String start_time;
  String end_time;
  String aca_year_id;
  String days;
  String submission_id;
  String student_id;
  String? submitted_date;
  String? grade;
  String? note;
  String assignment_file;
  String assignment_file_type;
  String assignment_file_size;
  String assignment_stud_file;
  String assignment_stud_file_type;
  String assignment_stud_file_size;

  AssignmentModel({
    required this.assign_id,
    required this.batch_id,
    required this.classis_id,
    required this.assign_title,
    required this.assign_description,
    required this.assign_end_of_submission_date,
    required this.teacher_id,
    required this.created_at,
    required this.modified_at,
    required this.draft,
    required this.attachment_id,
    required this.type,
    required this.type_id,
    required this.file,
    required this.file_type,
    required this.file_size,
    required this.subject_id,
    required this.batch_name,
    required this.start_time,
    required this.end_time,
    required this.aca_year_id,
    required this.days,
    required this.submission_id,
    required this.student_id,
    required this.submitted_date,
    required this.grade,
    required this.note,
    required this.assignment_file,
    required this.assignment_file_type,
    required this.assignment_file_size,
    required this.assignment_stud_file,
    required this.assignment_stud_file_type,
    required this.assignment_stud_file_size,
  });

  factory AssignmentModel.fromJson(Map<String, dynamic> json) {
    return AssignmentModel(
      assign_id: json['assign_id'].toString(),
      batch_id: json['batch_id'].toString(),
      classis_id: json['classis_id'].toString(),
      assign_title: json['assign_title'] as String,
      assign_description: json['assign_description'] as String,
      assign_end_of_submission_date:
          json['assign_end_of_submission_date'].toString(),
      teacher_id: json['teacher_id'].toString(),
      created_at: json['created_at'].toString(),
      modified_at: json['modified_at'].toString(),
      draft: json['draft'].toString(),
      attachment_id: json['attachment_id'].toString(),
      type: json['type'].toString(),
      type_id: json['type_id'].toString(),
      file: json['file'].toString(),
      file_type: json['file_type'].toString(),
      file_size: json['file_size'].toString(),
      subject_id: json['subject_id'].toString(),
      batch_name: json['batch_name'] as String,
      start_time: json['start_time'].toString(),
      end_time: json['end_time'].toString(),
      aca_year_id: json['aca_year_id'].toString(),
      days: json['days'].toString(),
      submission_id: json['submission_id'].toString(),
      student_id: json['student_id'].toString(),
      submitted_date: json['submitted_date'] as String,
      grade: json['grade'] as String,
      note: json['note'] as String,
      assignment_file: json['assignment_file'].toString(),
      assignment_file_type: json['assignment_file_type'].toString(),
      assignment_file_size: json['assignment_file_size'].toString(),
      assignment_stud_file: json['assignment_stud_file'].toString(),
      assignment_stud_file_type: json['assignment_stud_file_type'].toString(),
      assignment_stud_file_size: json['assignment_stud_file_size'].toString(),
    );
  }
}
