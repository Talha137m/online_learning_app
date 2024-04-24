class BaseURL {
  static const String BASE_URL = "https://admin.elms.pk";
  static const String CURRENCY = "PK";

  static const String ITEM_PURCHASE_CODE = "XXX";
  static const String ONESIGNAL_KEY = "3ccd8f42-7f12-4dff-aaac-2223d16363ef";
  static const String ONESIGNAL_TAG = "classis_1";

  static const String LOGIN_URL =
      BASE_URL + "/index.php/rest/login/check_login";
  static const String LOGIN_PARENT_URL =
      BASE_URL + "/index.php/rest/login/check_parent_login";
  static const String VERIFY_MOBILE_URL =
      BASE_URL + "/index.php/rest/login/verify_mobile";
  static const String GET_ANNOUNCEMENT_URL =
      BASE_URL + "/index.php/rest/announcement/get";
  static const String GET_TODAY_BATCHES_URL =
      BASE_URL + "/index.php/rest/master/today_batches";
  static const String GET_STUDY_MATERIAL_URL =
      BASE_URL + "/index.php/rest/study_material/get";
  static const String GET_ATTENDANCE_TOTAL_LIST_URL =
      BASE_URL + "/index.php/rest/attendance/student_attendance";
  static const String GET_ATTENDANCE_LIST_URL =
      BASE_URL + "/index.php/rest/attendance/student_monthly_attendance";
  static const String GET_MASTER_LIST_URL =
      BASE_URL + "/index.php/rest/master/all";
  static const String GET_ASSIGNMENTS_LIST_URL =
      BASE_URL + "/index.php/rest/assignment/get";
  static const String SUBMIT_ASSIGNMENTS_URL =
      BASE_URL + "/index.php/rest/assignment/submit";
  static const String GET_FEES_LIST_URL = BASE_URL + "/index.php/rest/fees/get";
  static const String GET_STUDENT_LIST_URL =
      BASE_URL + "/index.php/rest/student/list";
  static const String GET_TEACHER_LIST_URL =
      BASE_URL + "/index.php/rest/teachers/list";
  static const String GET_TEACHER_BATCHES_URL =
      BASE_URL + "/index.php/rest/teachers/batches";
  static const String GET_BATCHES_LIST_URL =
      BASE_URL + "/index.php/rest/batches/list";
  static const String GET_EXAM_ONLINE_LIST_URL =
      BASE_URL + "/index.php/rest/exam/get";
  static const String GET_EXAM_ONLINE_DETAIL_URL =
      BASE_URL + "/index.php/rest/exam/exam_details";
  static const String SUBMIT_EXAM_URL =
      BASE_URL + "/index.php/rest/exam/exam_attempt";
  static const String GET_FEES_REMAINING_URL =
      BASE_URL + "/index.php/rest/fees/get_remaining";
  static const String GET_EXAM_OFFLINE_LIST_URL =
      BASE_URL + "/index.php/rest/examoffline/get";
  static const String GET_EXAM_OFFLINE_DETAIL_URL =
      BASE_URL + "/index.php/rest/examoffline/exam_details";
  static const String GET_CLASSES_DETAIL_URL =
      BASE_URL + "/index.php/rest/classis/list";
  static const String GET_ONLINE_CLASSROOM_URL =
      BASE_URL + "/index.php/rest/onlineclassroom/get";

  static const String IMG_STUDENT = BASE_URL + "/uploads/students/";
  static const String IMG_PARENT = BASE_URL + "/uploads/parents/";
  static const String IMG_TEACHER = BASE_URL + "/uploads/teacher/";
  static const String IMG_ANNOUNCEMENT = BASE_URL + "/uploads/announcement/";
  static const String IMG_CLASSES = BASE_URL + "/uploads/classis/";

  static const String KEY_IS_LOGIN = "is_login";
  static const String KEY_USER_ID = "user_id";
  static const String KEY_USER_NAME = "user_name";
  static const String KEY_STATUS = "status";
  static const String KEY_USER_TYPE = "user_type_id";
  static const String KEY_STUDENT_DETAIL = "studentDetails";
  static const String KEY_BATCHES = "batches";
  static const String KEY_PARENTS = "parents";
  static const String KEY_LOGIN_TYPE =
      "login_type"; //student=1,parent=2,teacher=3

  static const String RESPONSE_STATUS = "responce";
  static const String DATA = "data";
  static const String MESSAGE = "message";
}
