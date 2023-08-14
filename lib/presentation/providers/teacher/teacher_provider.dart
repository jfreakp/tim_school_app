import 'package:flutter/material.dart';
import 'package:tim_school_app/domain/entities/student.dart';
import 'package:tim_school_app/domain/entities/teacher.dart';

import '../storage/sqlite_provider.dart';

class TeacherProvider extends ChangeNotifier {
  final studentListScrollController = ScrollController();

  Teacher? profileData;
  List<StudentList> studentList = [];

  TeacherProvider() {
    initProfile();
    getAllStudentList();
  }

  initProfile() async {
    profileData = await DBProvider.instance.getAllTeacher();
    notifyListeners();
  }

  getAllStudentList() async {
    studentList = await DBProvider.instance.getAllStudentList();
    moveScrollToBootom();
    notifyListeners();
    moveScrollToBootom();
  }

  createStudentList(StudentList studentList) async {
    studentList = await DBProvider.instance.createStudent(studentList);
    getAllStudentList();
    notifyListeners();
  }

  void deleteAllStudentList() async {
    try {
      await DBProvider.instance.deleteAllStudent();
      getAllStudentList();
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  void moveScrollToBootom() {
    late int heightScroll = 0;
    if(studentList.length> 4) heightScroll=110;
    studentListScrollController.animateTo(
        studentListScrollController.position.maxScrollExtent+heightScroll,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut);
  }
}
