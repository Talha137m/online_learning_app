class ParentModel {
  String parent_id;
  String classis_id;
  String? parent_fullname;
  String parent_occupation;
  String parent_phone;
  String parent_email;
  String parent_annual_income;
  String parent_office_address;
  String is_gov_employee;
  String? parent_type;
  String parent_gender;
  String parent_photo;
  String otp;
  String status;
  String student_id;

  ParentModel({
    required this.parent_id,
    required this.classis_id,
    required this.parent_fullname,
    required this.parent_occupation,
    required this.parent_phone,
    required this.parent_email,
    required this.parent_annual_income,
    required this.parent_office_address,
    required this.is_gov_employee,
    required this.parent_type,
    required this.parent_gender,
    required this.parent_photo,
    required this.otp,
    required this.status,
    required this.student_id,
  });

  factory ParentModel.fromJson(Map<String, dynamic> json) {
    return ParentModel(
      parent_id: json['parent_id'].toString(),
      classis_id: json['classis_id'].toString(),
      parent_fullname: json['parent_fullname'] as String,
      parent_occupation: json['parent_occupation'].toString(),
      parent_phone: json['parent_phone'].toString(),
      parent_email: json['parent_email'].toString(),
      parent_annual_income: json['parent_annual_income'].toString(),
      parent_office_address: json['parent_office_address'].toString(),
      is_gov_employee: json['is_gov_employee'].toString(),
      parent_type: json['parent_type'] as String,
      parent_gender: json['parent_gender'].toString(),
      parent_photo: json['parent_photo'].toString(),
      otp: json['otp'].toString(),
      status: json['status'].toString(),
      student_id: json['student_id'].toString(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'parent_id': parent_id,
      'classis_id': classis_id,
      'parent_fullname': parent_fullname,
      'parent_occupation': parent_occupation,
      'parent_phone': parent_phone,
      'parent_email': parent_email,
      'parent_annual_income': parent_annual_income,
      'parent_office_address': parent_office_address,
      'is_gov_employee': is_gov_employee,
      'parent_type': parent_type,
      'parent_gender': parent_gender,
      'parent_photo': parent_photo,
      'otp': otp,
      'status': status,
      'student_id': student_id,
    };
  }
}
