
import 'package:flutter/material.dart';
import 'package:tim_school_app/domain/entities/teacher.dart';

import '../storage/sqlite_provider.dart';

class TeacherProvider extends ChangeNotifier {
  final checkScrollController = ScrollController();

  Teacher? profileData;
  
  TeacherProvider() {
    initProfile();
  }

  initProfile() async {
    profileData = await DBProvider.instance.getAllTeacher();
    notifyListeners();
  }
}
