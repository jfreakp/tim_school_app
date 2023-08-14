import 'package:flutter/material.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'package:provider/provider.dart';
import 'package:tim_school_app/domain/entities/student.dart';

import '../../providers/teacher/teacher_provider.dart';

class NfcRead extends StatelessWidget {
  final ValueChanged<StudentList> onValue;

  const NfcRead({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<TeacherProvider>();

    ValueNotifier<dynamic> result = ValueNotifier(null);

    void tagRead() {
      NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
        var ndef = Ndef.from(tag);
        var payload = ndef!.cachedMessage!.records[0].payload;
        var sub = payload.sublist(payload[0] + 1);
        String tagRecordText = String.fromCharCodes(sub);
        result.value = tagRecordText;
      });
    }

    tagRead();
    return Center(
      child: FutureBuilder<bool>(
        future: NfcManager.instance.isAvailable(),
        builder: ((context, snapshot) => snapshot.data != true
            ? Center(child: Text('NfcManager.isAvailable(): ${snapshot.data}'))
            : ValueListenableBuilder<dynamic>(
                valueListenable: result,
                builder: ((context, value, child) {
                  if (value != null) {
                    final studentList = StudentList(
                        ci: value,
                        migrated: 0,
                        teacherCi: '${provider.profileData?.id ?? ''}',
                        createdAt: DateTime.now());
                    onValue(studentList);
                  }
                  return const SizedBox(height: 0);
                }),
              )),
      ),
    );
  }
}
