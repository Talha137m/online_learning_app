class AnnouncementModel {
  String id;
  String batch_id;
  String classis_id;
  String title;
  String? message;
  String? image;
  String recipients;
  String? created_at;
  String modified_at;
  String draft;
  String batches;

  AnnouncementModel({
    required this.id,
    required this.batch_id,
    required this.classis_id,
    required this.title,
    required this.message,
    required this.image,
    required this.recipients,
    required this.created_at,
    required this.modified_at,
    required this.draft,
    required this.batches,
  });

  factory AnnouncementModel.fromJson(Map<String, dynamic> json) {
    return AnnouncementModel(
      id: json['id'].toString(),
      batch_id: json['batch_id'].toString(),
      classis_id: json['classis_id'].toString(),
      title: json['title'].toString(),
      message: json['message'] ,
      image: json['image'] ,
      recipients: json['recipients'].toString(),
      created_at: json['created_at'],
      modified_at: json['modified_at'].toString(),
      draft: json['draft'].toString(),
      batches: json['batches'].toString(),
    );
  }
}
