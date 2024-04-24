class ExamQuestionOptionModel {
  String opt_id;
  String classis_id;
  String exam_id;
  String que_id;
  String? opt_description;
  String opt_is_correct;

  ExamQuestionOptionModel({
    required this.opt_id,
    required this.classis_id,
    required this.exam_id,
    required this.que_id,
    required this.opt_description,
    required this.opt_is_correct,
  });

  factory ExamQuestionOptionModel.fromJson(Map<String, dynamic> json) {
    return ExamQuestionOptionModel(
      opt_id: json['opt_id'].toString(),
      classis_id: json['classis_id'].toString(),
      exam_id: json['exam_id'].toString(),
      que_id: json['que_id'].toString(),
      opt_description: json['opt_description'] as String,
      opt_is_correct: json['opt_is_correct'].toString(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'opt_id': opt_id,
      'classis_id': classis_id,
      'exam_id': exam_id,
      'que_id': que_id,
      'opt_description': opt_description,
      'opt_is_correct': opt_is_correct,
    };
  }
}
