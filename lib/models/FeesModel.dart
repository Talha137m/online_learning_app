class FeesModel {
  String batch_id;
  String? batch_name;
  String? fees_type;
  String amount;
  String fees_paid_id;
  String receipt_no;
  String paid_amount;
  String? note;
  String? paid_date;

  FeesModel({
    required this.batch_id,
    required this.batch_name,
    required this.fees_type,
    required this.amount,
    required this.fees_paid_id,
    required this.receipt_no,
    required this.paid_amount,
    required this.note,
    required this.paid_date,
  });

  factory FeesModel.fromJson(Map<String, dynamic> json) {
    return FeesModel(
      batch_id: json['batch_id'].toString(),
      batch_name: json['batch_name'] as String,
      fees_type: json['fees_type'] as String,
      amount: json['amount'].toString(),
      fees_paid_id: json['fees_paid_id'].toString(),
      receipt_no: json['receipt_no'].toString(),
      paid_amount: json['paid_amount'].toString(),
      note: json['note'] as String,
      paid_date: json['paid_date'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'batch_id': batch_id,
      'batch_name': batch_name,
      'fees_type': fees_type,
      'amount': amount,
      'fees_paid_id': fees_paid_id,
      'receipt_no': receipt_no,
      'paid_amount': paid_amount,
      'note': note,
      'paid_date': paid_date,
    };
  }
}
