class SubjectModel {
  String subject_id;
  String subject_name;

  SubjectModel({
    required this.subject_name,
    required this.subject_id,
  });

  factory SubjectModel.fromJson(Map<String, dynamic> json) {
    return SubjectModel(
      subject_name: json['subject_name'].toString(),
      subject_id: json['subject_id'].toString(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'subject_name': subject_name,
      'subject_id': subject_id,
    };
  }
}
