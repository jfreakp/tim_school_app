import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tim_school_app/domain/dll/create_db.dart';
import 'package:tim_school_app/domain/entities/student.dart';
import 'package:tim_school_app/domain/entities/teacher.dart';

class DBProvider {
  static final DBProvider instance = DBProvider._init();

  static Database? _database;

  DBProvider._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('db_time_school7.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute(CreateTeacher().getCreate());
    await db.execute(CreateStudentList().getCreate());
    await db.rawInsert(CreateTeacher().insertTable());
  }

// Teacher CRUD methods
  Future<Teacher?> getAllTeacher() async {
    final db = await database;
    final res = await db.query('teacher');
    return res.isNotEmpty
        ? res.map((s) => Teacher.fromJson(s)).toList()[0]
        : null;
  }

  //
  Future<StudentList> createStudent(StudentList student) async {
    final db = await database;
    final id = await db.insert('studentlist', student.toJson());
    return student.copyWith(id: id);
  }

   Future<List<StudentList>> getAllStudentList() async {
    final db = await database;
    final res = await db.query('studentlist');
    return res.isNotEmpty ? res.map((s) => StudentList.fromJson(s)).toList() : [];
  }

  deleteAllStudent() async{
    final db = await database;
    final res = await db.delete('studentlist');    
    print(res);
  }
}
