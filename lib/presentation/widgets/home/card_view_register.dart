import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tim_school_app/domain/entities/student.dart';

class CardViewRegister extends StatelessWidget {
  final StudentList studentList;

  const CardViewRegister({super.key, required this.studentList});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.amber,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.all(15),
      elevation: 10,
      child: Column(
        children: <Widget>[
          ListTile(
            contentPadding: const EdgeInsets.fromLTRB(15, 10, 25, 0),
            title: Text(studentList.ci),
            subtitle: Text(DateFormat.yMMMMEEEEd().format(studentList.createdAt)),
            leading: const Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}
