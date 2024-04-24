class ClassesModel {
  String classis_id;
  String classis_name;
  String classis_logo;
  String classis_phone_no;
  String classis_address;
  String classis_lat;
  String classis_lon;
  String classis_board;
  String classis_reg_no;
  String classis_website;
  String? classis_details;
  String classis_email;
  String user_id;
  String user_type_id;
  String user_name;
  String user_email;
  String user_password;
  String status;

  ClassesModel({
    required this.classis_id,
    required this.classis_name,
    required this.classis_logo,
    required this.classis_phone_no,
    required this.classis_address,
    required this.classis_lat,
    required this.classis_lon,
    required this.classis_board,
    required this.classis_reg_no,
    required this.classis_website,
    required this.classis_details,
    required this.classis_email,
    required this.user_id,
    required this.user_type_id,
    required this.user_name,
    required this.user_email,
    required this.user_password,
    required this.status,
  });

  factory ClassesModel.fromJson(Map<String, dynamic> json) {
    return ClassesModel(
      classis_id: json['classis_id'].toString(),
      classis_name: json['classis_name'].toString(),
      classis_logo: json['classis_logo'].toString(),
      classis_phone_no: json['classis_phone_no'].toString(),
      classis_address: json['classis_address'].toString(),
      classis_lat: json['classis_lat'].toString(),
      classis_lon: json['classis_lon'].toString(),
      classis_board: json['classis_board'].toString(),
      classis_reg_no: json['classis_reg_no'].toString(),
      classis_website: json['classis_website'].toString(),
      classis_details: json['classis_details'] as String,
      classis_email: json['classis_email'].toString(),
      user_id: json['user_id'].toString(),
      user_type_id: json['user_type_id'].toString(),
      user_name: json['user_name'].toString(),
      user_email: json['user_email'].toString(),
      user_password: json['user_password'].toString(),
      status: json['status'].toString(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'classis_id': classis_id,
      'classis_name': classis_name,
      'classis_logo': classis_logo,
      'classis_phone_no': classis_phone_no,
      'classis_address': classis_address,
      'classis_lat': classis_lat,
      'classis_lon': classis_lon,
      'classis_board': classis_board,
      'classis_reg_no': classis_reg_no,
      'classis_website': classis_website,
      'classis_details': classis_details,
      'classis_email': classis_email,
      'user_id': user_id,
      'user_type_id': user_type_id,
      'user_name': user_name,
      'user_email': user_email,
      'user_password': user_password,
      'status': status,
    };
  }
}
