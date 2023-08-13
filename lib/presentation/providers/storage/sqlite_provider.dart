import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tim_school_app/domain/dll/create_db.dart';
import 'package:tim_school_app/domain/entities/teacher.dart';

class DBProvider {
  static final DBProvider instance = DBProvider._init();

  static Database? _database;

  DBProvider._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('db_time_school5.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute(CreateTeacher().getCreate());
    await db.rawInsert(CreateTeacher().insertTable());
  }

  Future<Teacher?> getAllTeacher() async {
    final db = await database;
    final res = await db.query('teacher');
    return res.isNotEmpty
        ? res.map((s) => Teacher.fromJson(s)).toList()[0]
        : null;
  }
}
