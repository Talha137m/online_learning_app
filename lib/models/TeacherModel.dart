class TeacherModel {
  String? teacher_id;
  String classis_id;
  String? teacher_fullname;
  String teacher_gender;
  String? teacher_qualification;
  String teacher_photo;
  String teacher_address;
  String teacher_phone;
  String teacher_email;
  String teacher_bdate;
  String teacher_id_card_no;
  String teacher_join_date;
  String teacher_is_leave;
  String teacher_leave_date;
  String teacher_leave_description;
  String created_at;
  String modified_at;
  String draft;
  String user_id;
  String user_type_id;
  String user_name;
  String user_email;
  String user_password;
  String fcm_code;
  String apn_token;
  String request_token;
  String onesignal_player_id;
  String status;

  TeacherModel({
    required this.teacher_id,
    required this.classis_id,
    required this.teacher_fullname,
    required this.teacher_gender,
    required this.teacher_qualification,
    required this.teacher_photo,
    required this.teacher_address,
    required this.teacher_phone,
    required this.teacher_email,
    required this.teacher_bdate,
    required this.teacher_id_card_no,
    required this.teacher_join_date,
    required this.teacher_is_leave,
    required this.teacher_leave_date,
    required this.teacher_leave_description,
    required this.created_at,
    required this.modified_at,
    required this.draft,
    required this.user_id,
    required this.user_type_id,
    required this.user_name,
    required this.user_email,
    required this.user_password,
    required this.fcm_code,
    required this.apn_token,
    required this.request_token,
    required this.onesignal_player_id,
    required this.status,
  });

  factory TeacherModel.fromJson(Map<String, dynamic> json) {
    return TeacherModel(
      teacher_id: json['teacher_id'] as String,
      classis_id: json['classis_id'].toString(),
      teacher_fullname: json['teacher_fullname'] as String,
      teacher_gender: json['teacher_gender'].toString(),
      teacher_qualification: json['teacher_qualification'] as String,
      teacher_photo: json['teacher_photo'].toString(),
      teacher_address: json['teacher_address'].toString(),
      teacher_phone: json['teacher_phone'].toString(),
      teacher_email: json['teacher_email'].toString(),
      teacher_bdate: json['teacher_bdate'].toString(),
      teacher_id_card_no: json['teacher_id_card_no'].toString(),
      teacher_join_date: json['teacher_join_date'].toString(),
      teacher_is_leave: json['teacher_is_leave'].toString(),
      teacher_leave_date: json['teacher_leave_date'].toString(),
      teacher_leave_description: json['teacher_leave_description'].toString(),
      created_at: json['created_at'].toString(),
      modified_at: json['modified_at'].toString(),
      draft: json['draft'].toString(),
      user_id: json['user_id'].toString(),
      user_type_id: json['user_type_id'].toString(),
      user_name: json['user_name'].toString(),
      user_email: json['user_email'].toString(),
      user_password: json['user_password'].toString(),
      fcm_code: json['fcm_code'].toString(),
      apn_token: json['apn_token'].toString(),
      request_token: json['request_token'].toString(),
      onesignal_player_id: json['onesignal_player_id'].toString(),
      status: json['status'].toString(),
    );
  }
}
