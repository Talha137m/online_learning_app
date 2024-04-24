import 'package:flutter/material.dart';
import 'package:classes_app/theme/Color.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'dart:async';
import 'dart:ui';
import 'dart:io';
import 'dart:io' show Platform;
import 'dart:isolate';
import 'package:permission_handler/permission_handler.dart' as permis;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:mime_type/mime_type.dart';
// import 'package:ext_storage/ext_storage.dart';

import 'package:classes_app/screens/assignments/body/Body.dart';
import 'package:classes_app/screens/assignments/ViewDocument.dart';
import 'package:classes_app/screens/assignments/AssignmentDetail.dart';

import 'package:classes_app/models/AssignmentModel.dart';
import 'package:classes_app/models/BatchModel.dart';

import 'package:classes_app/config/BaseURL.dart';
import 'package:classes_app/config/globals.dart' as globles;
import 'package:classes_app/utils/CallApi.dart';
import 'package:classes_app/utils/DateFormatter.dart';
import 'package:classes_app/utils/app_localizations.dart';

class Assignments extends StatefulWidget {
  static String textdata = "";

  @override
  _AssigmentsState createState() => _AssigmentsState();
}

class _AssigmentsState extends State<Assignments> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  late SharedPreferences sharedPrefs;

  static DateTime now = new DateTime.now();

  int _selectedMonth = now.month;
  String _selectedYear = now.year.toString();
  String _selectedClassesID = "";
  String _selectedClasses = "";
  List<String> _monthList = [];
  List<String> _yearList = [];
  List<String> _classList = [];
  List<BatchModel> _batchesModelList = [];
  List<AssignmentModel> _assignmentModelList = [];
  bool _showFilter = false;

  List<_TaskInfo> _tasks = [];
  List<_ItemHolder> _items = [];
  String? _localPath;
  ReceivePort _port = ReceivePort();

  String? _fileName;
  var isFirsTime = true;

  //static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  /*static void downloadCallback(String id, DownloadTaskStatus status,
      int progress, String filename) async {
    print(
        'Background Isolate Callback: task ($id) is in status ($status) and process ($progress)');
    print("title2" + Assignments.textdata);
    _showProgressNotification(status.value, Assignments.textdata, progress);
  }*/

  @override
  void initState() {
    super.initState();

    initDownload();

    setState(() {
      _yearList.clear();
      for (int i = 2016; i <= now.year; i++) {
        _yearList.add(new DateFormat('yyyy').format(new DateTime(i, 1)));
      }
      _monthList.clear();
      for (int i = 1; i <= 12; i++) {
        _monthList.add(new DateFormat('MMMM', globles.lang)
            .format(new DateTime(now.year, i, 1)));
      }
    });

    _classList.clear();

    SharedPreferences.getInstance().then((prefs) {
      setState(() => sharedPrefs = prefs);
      if (sharedPrefs.containsKey("batches_list")) {
        final List studentList =
            jsonDecode(sharedPrefs.getString("batches_list").toString());
        _batchesModelList.addAll(
            studentList.map((val) => BatchModel.fromJson(val)).toList());
        if (_batchesModelList.length > 0) {
          _selectedClasses = _batchesModelList[0].batch_name.toString();
          _selectedClassesID = _batchesModelList[0].batch_id;
          for (int i = 0; i < _batchesModelList.length; i++) {
            if (!_classList.contains(_batchesModelList[i].batch_name))
              _classList.add(_batchesModelList[i].batch_name.toString());
          }
        }
        _makeGetAssignments(context);
      }
    });
  }

  @override
  void didUpdateWidget(Assignments oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  initDownload() async {
    _bindBackgroundIsolate();

    //FlutterDownloader.registerCallback(downloadCallback);
  }

  @override
  void dispose() {
    _unbindBackgroundIsolate();
    super.dispose();
  }

  void _unbindBackgroundIsolate() {
    IsolateNameServer.removePortNameMapping('downloader_send_port');
  }

  void _bindBackgroundIsolate() {
    bool isSuccess = IsolateNameServer.registerPortWithName(
        _port.sendPort, 'downloader_send_port');
    if (!isSuccess) {
      _unbindBackgroundIsolate();
      _bindBackgroundIsolate();
      return;
    }
    _port.listen((dynamic data) {
      print('UI Isolate Callback: $data');
      String id = data[0];
      DownloadTaskStatus status = data[1];
      int progress = data[2];

      /*final task = _tasks?.firstWhere((task) => task.taskId == id);
      if (task != null) {
        setState(() {
          task.status = status;
          task.progress = progress;
        });
        _showProgressNotification(status.value, task.name, progress);
      }*/
    });
  }

  static void downloadCallback(
      String id, DownloadTaskStatus status, int progress) {
    print(
        'Background Isolate Callback: task ($id) is in status ($status) and process ($progress)');
    final SendPort send =
        IsolateNameServer.lookupPortByName('downloader_send_port')!;
    send.send([id, status, progress]);
  }

  void _gotoDetail(AssignmentModel assignmentModel) async {
    final result = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => AssignmentDetail(
                  /*fileUrl: finalUrl,
                          title: assignmentModel.assign_title,*/
                  assignmentModel: assignmentModel,
                )));
    if (result != null) {
      setState(() {
        isFirsTime = true;
      });
      _makeGetAssignments(context);
    }
  }

  TargetPlatform? platform;

  @override
  Widget build(BuildContext context) {
    platform = Theme.of(context).platform;

    return Scaffold(
      key: _scaffoldKey,
      appBar: new AppBar(
        title: new Text(AppLocalizations.of(context).translate("assignments")),
        backgroundColor: ColorsInt.colorPrimary,
        actions: <Widget>[
          new InkWell(
            child: new Image.asset("assets/images/ic_filter.png"),
            onTap: () {
              setState(() {
                _showFilter = !_showFilter;
              });
            },
          ),
        ],
      ),
      body: new Body(
        showFilter: _showFilter,
        selectedMonth: _selectedMonth,
        selectedYear: _selectedYear,
        selectedClasses: _selectedClasses,
        monthList: _monthList,
        yearList: _yearList,
        classList: _classList,
        assignmentModelList: _assignmentModelList,
        onMonthSelected: (int newValue) {
          setState(() {
            var isNew = (_selectedYear != newValue);
            _selectedMonth = newValue;
            if (isNew) {
              _makeGetAssignments(context);
            }
          });
        },
        onYearSelected: (String newValue) {
          setState(() {
            var isNew = (_selectedYear != newValue);
            _selectedYear = newValue;
            if (isNew) {
              _makeGetAssignments(context);
            }
          });
        },
        onClassesSelected: (String newValue) {
          setState(() {
            var selectedBatch = _getBatchDetailByName(newValue);
            if (selectedBatch != null) {
              var isNew = (_selectedClasses != newValue);
              _selectedClasses = newValue;
              _selectedClassesID = selectedBatch.batch_id;
              if (isNew) {
                _makeGetAssignments(context);
              }
            }
          });
        },
        onViewClick: (AssignmentModel assignmentModel) =>
            _gotoDetail(assignmentModel),
        onSubmitClick: (AssignmentModel assignmentModel) {
          if (sharedPrefs.getInt(BaseURL.KEY_LOGIN_TYPE) == 1) {
            _checkPermission().then((isGranted) {
              _openFileExplorer(FileType.any, false).then((filePath) {
                print("pickupPath:" + filePath);
                if (filePath.isNotEmpty) {
                  _makeSubmitAssignments(
                      context, assignmentModel.assign_id, filePath);
                }
              });
            });
          }
        },
      ),
    );
  }

  BatchModel? _getBatchDetailByName(String name) {
    for (BatchModel batchModel in _batchesModelList) {
      if (batchModel.batch_name == name) {
        return batchModel;
      }
    }
    return null;
  }

  _makeGetAssignments(BuildContext context) {
    var url = BaseURL.GET_ASSIGNMENTS_LIST_URL;
    var map = new Map<String, String>();
    map['student_id'] = sharedPrefs.getString(BaseURL.KEY_USER_ID).toString();
    map['month'] = (isFirsTime)
        ? ""
        : DateFormatter.getConvetedDate(
            "${now.year}-${_selectedMonth.toString()}-1", 1);
    map['year'] = (isFirsTime) ? "" : _selectedYear;
    map['batch'] = (isFirsTime) ? "" : _selectedClassesID;

    setState(() {
      if (_assignmentModelList.length > 0) {
        _assignmentModelList.clear();
      }
      isFirsTime = false;
    });

    CallApi().post(context, url, map, true).then((response) {
      final List dataJson = json.decode(response.toString());
      setState(() {
        if (_assignmentModelList.length > 0) {
          _assignmentModelList.clear();
        }
        _assignmentModelList.addAll(
            dataJson.map((val) => AssignmentModel.fromJson(val)).toList());
      });
    }, onError: (error) {
      _displaySnackBar(context, error.toString());
    });
  }

  _makeSubmitAssignments(
      BuildContext context, String assignment_id, String filePath) async {
    var url = BaseURL.SUBMIT_ASSIGNMENTS_URL;

    String mimeType = mime(filePath.split('/').last).toString();

    FormData formData = new FormData.fromMap({
      "student_id": "${sharedPrefs.getString(BaseURL.KEY_USER_ID)}",
      "assign_id": "$assignment_id",
      "subassignment_file": await MultipartFile.fromFile(filePath,
          filename: _fileName,
          contentType:
              MediaType(mimeType.split("/").first, mimeType.split("/").last))
    });

    CallApi().postFile(context, url, formData, true).then((response) {
      _displaySnackBar(context,
          AppLocalizations.of(context).translate("assignment_submitted"));
      setState(() {
        isFirsTime = true;
      });
      _makeGetAssignments(context);
    }, onError: (error) {
      _displaySnackBar(context, error.toString());
    });
  }

  Future<bool> _checkPermission() async {
    return await permis.Permission.storage.request().isGranted;
  }

  Future<Null> _prepare(
      String fileUrl, String fileName, AssignmentModel assignmentsModel) async {
    final tasks = await FlutterDownloader.loadTasks();

    int count = 0;
    _tasks = [];
    _items = [];

    /*_showNotification();
    showNotificationWithDefaultSound();*/

    _tasks.add(_TaskInfo(name: fileName, link: fileUrl));
    _items.add(_ItemHolder(name: 'Images'));
    for (int i = count; i < _tasks.length; i++) {
      _items.add(_ItemHolder(name: _tasks[i].name, task: _tasks[i]));
      count++;
    }

    tasks?.forEach((task) {
      for (_TaskInfo info in _tasks) {
        if (info.link == task.url) {
          info.taskId = task.taskId;
          info.status = task.status;
          info.progress = task.progress;
        }
      }
    });

    _localPath = await _findLocalPath();
    //_localPath = (await _findLocalPath()) + '/Download/${Strings.app_name}';
    //_localPath = (await _findLocalPath()) + Platform.pathSeparator + Strings.app_name;

    final savedDir = Directory(_localPath.toString());
    bool hasExisted = await savedDir.exists();
    if (!hasExisted) {
      savedDir.create();
    }

    final file = File("$_localPath/$fileName");
    file.exists().then((isExisted) {
      if (isExisted) {
        print("static" + Assignments.textdata);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ViewDocument(
                      //fileUrl: "$_localPath/$fileName",
                      fileUrl: fileUrl,
                      title: assignmentsModel.assign_title.toString(),
                    )));
      } else {
        print("sdsdf" + fileName);
        Assignments.textdata = "hi";
        _requestDownload(_tasks[0]);
      }
    });
  }

  void _requestDownload(_TaskInfo task) async {
    task.taskId = await FlutterDownloader.enqueue(
        url: task.link,
        headers: {"auth": "test_for_sql_encoding"},
        savedDir: _localPath.toString(),
        showNotification: true,
        openFileFromNotification: true);
  }

  Future<String> _findLocalPath() async {
    print(Platform.operatingSystem);
    print("1" + (await getApplicationDocumentsDirectory()).path);
    print("2" + (await getExternalStorageDirectory())!.path);
    print("3" +
        (await getExternalStorageDirectories(
                type: StorageDirectory.downloads))![0]
            .path);
    print("4" + getExternalStorageDirectories().toString());

    /*final directory = Platform.isIOS
        ? (await getApplicationDocumentsDirectory()).path
        : (await ExtStorage.getExternalStorageDirectory());*/

    final directory = platform == TargetPlatform.android
        ? await getExternalStorageDirectory()
        : await getApplicationDocumentsDirectory();

    if (platform == TargetPlatform.android) {
      return "/sdcard/download/${AppLocalizations.of(context).translate("app_name")}";
    } else {
      return directory!.path;
    }
    // return directory; //.path;
  }

  Future<String> _openFileExplorer(
      FileType _pickingType, bool _multiPick) async {
    List<String> extenstionList = ['jpg', 'pdf', 'doc', 'png'];

    String? _path;
    List<String>? _paths;

    try {
      if (_multiPick) {
        _path = null;
        FilePickerResult? result = await FilePicker.platform.pickFiles(
            type: FileType.custom, allowedExtensions: extenstionList);
        if (result != null) {
          List<File> files =
              result.paths.map((path) => File(path.toString())).toList();
          _paths = files.map((e) => e.path).toList();
        }
      } else {
        _path = null;
        FilePickerResult? result = await FilePicker.platform.pickFiles();
        if (result != null) {
          File file = File(result.files.single.path.toString());
          _path = file.path;
        }
      }
    } on PlatformException catch (e) {
      print("Unsupported operation" + e.toString());
    }
    if (!mounted)
      setState(() {
        _fileName = _path != null
            ? _path.split('/').last
            : _paths != null
                ? _paths.toString()
                : '...';
      });
    return _path.toString();
  }

  _displaySnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
    ));
  }
}

class _TaskInfo {
  final String name;
  final String link;
  String? taskId;

  int progress = 0;
  DownloadTaskStatus status = DownloadTaskStatus.undefined;

  _TaskInfo({required this.name, required this.link});
}

class _ItemHolder {
  final String name;
  final _TaskInfo? task;

  _ItemHolder({required this.name, this.task});
}
