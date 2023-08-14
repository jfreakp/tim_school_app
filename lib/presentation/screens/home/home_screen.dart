import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tim_school_app/domain/entities/student.dart';
import 'package:tim_school_app/presentation/providers/teacher/teacher_provider.dart';
import 'package:tim_school_app/presentation/widgets/home/card_view_register.dart';
import 'package:tim_school_app/presentation/widgets/home/student_list_info.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final teacher = context.watch<TeacherProvider>();

    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            
              child: const Icon(Icons.refresh),
              onPressed: () {
                teacher.deleteAllStudentList();
              }),
              const SizedBox(height: 16),
          FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () {
                final studentList = StudentList(
                    ci: '1104391774',
                    migrated: 0,
                    teacherCi: '111111111',
                    createdAt: DateTime.now());
                teacher.createStudentList(studentList);
              }),
        ],
      ),
      body: Column(
        children: [
           Row(
            children: [
              StudentListInfo(title: 'Total', subtitle: '${teacher.studentList.length}'),
              const Divider(),
              StudentListInfo(title: 'Profesor', subtitle: '${teacher.profileData?.id ?? ''}'),
            ],
          ),
          const SizedBox(height: 16),
          const Text('resultados'),
          Expanded(
            child: ListView.builder(
              controller: teacher.studentListScrollController,
              itemCount: teacher.studentList.length,
              itemBuilder: ((context, index) {
                final student = teacher.studentList[index];
                return CardViewRegister(studentList: student);
              }),
            ),
          ),
          const SizedBox(height: 18),
        ],
      ),
    );
  }
}
