class BankModel {
  String bank_acc_id;
  String classis_id;
  String acc_holder_name;
  String acc_no;
  String acc_ifsc;
  String? acc_type;
  String? bank_name;
  String payment_note;
  String created_at;

  BankModel({
    required this.bank_acc_id,
    required this.classis_id,
    required this.acc_holder_name,
    required this.acc_no,
    required this.acc_ifsc,
    required this.acc_type,
    required this.bank_name,
    required this.payment_note,
    required this.created_at,
  });

  factory BankModel.fromJson(Map<String, dynamic> json) {
    return BankModel(
      bank_acc_id: json['bank_acc_id'].toString(),
      classis_id: json['classis_id'].toString(),
      acc_holder_name: json['acc_holder_name'].toString(),
      acc_no: json['acc_no'].toString(),
      acc_ifsc: json['acc_ifsc'].toString(),
      acc_type: json['acc_type'] as String,
      bank_name: json['bank_name'] as String,
      payment_note: json['payment_note'].toString(),
      created_at: json['created_at'].toString(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'bank_acc_id': bank_acc_id,
      'classis_id': classis_id,
      'acc_holder_name': acc_holder_name,
      'acc_no': acc_no,
      'acc_ifsc': acc_ifsc,
      'acc_type': acc_type,
      'bank_name': bank_name,
      'payment_note': payment_note,
      'created_at': created_at,
    };
  }
}
