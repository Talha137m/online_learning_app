import 'package:classes_app/models/ExamQuestionOptionModel.dart';

class ExamQuestionModel {
  String? que_id;
  String classis_id;
  String exam_id;
  String? que_description;
  String que_ans_multiple;
  String? ex_opt_id;
  String? attempt_id;
  String? student_id;
  String? option_ids;
  String? attempt_type;
  String? marks_apply_in;
  List<ExamQuestionOptionModel>? options;

  List<String>? selectedIds;

  ExamQuestionModel({
    required this.que_id,
    required this.classis_id,
    required this.exam_id,
    required this.que_description,
    required this.que_ans_multiple,
    this.options,
    this.ex_opt_id,
    this.attempt_id,
    this.student_id,
    this.option_ids,
    this.attempt_type,
    this.marks_apply_in,
    required this.selectedIds,
  });

  factory ExamQuestionModel.fromJson(Map<String, dynamic> json) {
    return ExamQuestionModel(
      que_id: json['que_id'] as String,
      classis_id: json['classis_id'].toString(),
      exam_id: json['exam_id'].toString(),
      que_description: json['que_description'] as String,
      que_ans_multiple: json['que_ans_multiple'].toString(),
      ex_opt_id:
          (json.containsKey("ex_opt_id")) ? json['ex_opt_id'].toString() : null,
      attempt_id: (json.containsKey("attempt_id"))
          ? json['attempt_id'].toString()
          : null,
      student_id: (json.containsKey("student_id"))
          ? json['student_id'].toString()
          : null,
      option_ids: (json.containsKey("option_ids"))
          ? json['option_ids'].toString()
          : null,
      attempt_type: (json.containsKey("attempt_type"))
          ? json['attempt_type'].toString()
          : null,
      marks_apply_in: (json.containsKey("marks_apply_in"))
          ? json['marks_apply_in'].toString()
          : null,
      options: (json['options'] as List)
          .map((i) => ExamQuestionOptionModel.fromJson(i))
          .toList(),
      selectedIds: [],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'que_id': que_id,
      'classis_id': classis_id,
      'exam_id': exam_id,
      'que_description': que_description,
      'que_ans_multiple': que_ans_multiple,
      'options': options,
      'selectedIds': selectedIds,
      'ex_opt_id': ex_opt_id,
      'attempt_id': attempt_id,
      'student_id': student_id,
      'option_ids': option_ids,
      'attempt_type': attempt_type,
      'marks_apply_in': marks_apply_in,
    };
  }
}
