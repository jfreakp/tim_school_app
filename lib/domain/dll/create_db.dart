const tableTeacher = 'teacher';
const tableStudentList = 'studentlist';
const notNull = 'NOT NULL';
const idType = 'INTEGER PRIMARY KEY';// AUTOINCREMENT';
const textType = 'TEXT';
const dateTimetype = 'DATETIME';
const boolType = 'INTEGER';

class CreateTeacher {
  String getCreate() {
    const sql = '''
      CREATE TABLE $tableTeacher ( 
        id $idType $notNull,  
        first_name $textType $notNull,
        last_name $textType $notNull,
        email $textType $notNull,
        cell_phone $textType,
        phone $textType,
        status $textType $notNull
      );
    ''';
    return sql;
  }

  String insertTable() {
    const insert =
        'INSERT INTO teacher(id,first_name,last_name, email, cell_phone, phone, status) '
        'VALUES(1,"NombreTest","ApellidoTest", "emailTest", "cellPhoneTest", "phoneTest", 1)';
    return insert;
  }
}

class CreateStudentList {
  String getCreate() {
    const sql = '''
      CREATE TABLE $tableStudentList ( 
        id $idType $notNull,  
        ci $textType $notNull,
        migrated $boolType $notNull,
        teacher_ci $textType $notNull,
        created_at $dateTimetype $notNull
      );
    ''';
    return sql;
  }
}
