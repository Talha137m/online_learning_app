class StudyMaterialModel {
  String material_id;
  String classis_id;
  String subject_id;
  String teacher_id;
  String? title;
  String? description;
  String? type;
  String? video_type;
  String? video_url;
  String? created_at;
  String modified_at;
  String draft;
  String attachment_id;
  String type_id;
  String? file;
  String file_type;
  String file_size;
  String? subject_name;
  String? batches;

  StudyMaterialModel({
    required this.material_id,
    required this.classis_id,
    required this.subject_id,
    required this.teacher_id,
    required this.title,
    required this.description,
    required this.type,
    required this.video_type,
    required this.video_url,
    required this.created_at,
    required this.modified_at,
    required this.draft,
    required this.attachment_id,
    required this.type_id,
    required this.file,
    required this.file_type,
    required this.file_size,
    required this.subject_name,
    required this.batches,
  });

  factory StudyMaterialModel.fromJson(Map<String, dynamic> json) {
    return StudyMaterialModel(
      material_id: json['material_id'].toString(),
      classis_id: json['classis_id'].toString(),
      subject_id: json['subject_id'].toString(),
      teacher_id: json['teacher_id'].toString(),
      title: json['title'] as String,
      description: json['description'] as String,
      type: json['type'] as String,
      video_type: json['video_type'] as String,
      video_url: json['video_url'] as String,
      created_at: json['created_at'] as String,
      modified_at: json['modified_at'].toString(),
      draft: json['draft'].toString(),
      attachment_id: json['attachment_id'].toString(),
      type_id: json['type_id'].toString(),
      file: json['file'] as String,
      file_type: json['file_type'].toString(),
      file_size: json['file_size'].toString(),
      subject_name: json['subject_name'] as String,
      batches: json['batches'] as String,
    );
  }
}
