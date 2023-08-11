import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tim_school_app/domain/dll/create_teacher.dart';
import 'package:tim_school_app/domain/entities/teacher.dart';

class SqliteProvider {
  static final SqliteProvider instance = SqliteProvider._init();

  static Database? _database;

  SqliteProvider._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('db_checking.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final sql = CreateTeacher().getCreate();
    await db.execute(sql);
    await db.rawInsert(CreateTeacher().insertTable());
  }

  Future<Teacher> getTeacher() async {
    final db = await database;
    final res = await db.query('Table');
    List<Teacher> list =
        res.isNotEmpty ? res.map((s) => Teacher.fromJson(s)).toList() : [];
    return list[0];
  }

/*
  Future<Teacher> create(Teacher teacher) async {
    final db = await instance.database;
    final id = await db.insert(tableChecking, checking.toJson());
    return checking.copy(id: id);
  }

  Future<List<Checking>> getAllCheckink() async {
    final db = await database;
    final res = await db.query(tableChecking);

    return res.isNotEmpty ? res.map((s) => Checking.fromJson(s)).toList() : [];
  }

  Future<int> getCountTable(String table) async {
    final db = await database;
    final res = await db.rawQuery("select count(*) from $table");
    return Sqflite.firstIntValue(res) ?? 0;
  }
  */
}
