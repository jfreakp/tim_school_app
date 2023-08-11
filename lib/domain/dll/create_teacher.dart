const tableTeacher = 'teacher';
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
        firstName $textType $notNull,
        lastName $textType $notNull,
        email $textType $notNull,
        cellPhone $textType $notNull,
        phone $textType $notNull,
        status $textType $notNull,
      );
    ''';
    return sql;
  }

  String insertTable() {
    const insert =
        'INSERT INTO teacher(id,firstName,lastName, email, cellPhone, phone, status)'
        'VALUES(1,"NombreTest","ApellidoTest", "emailTest", "cellPhoneTest", "phoneTest", 1)';
    return insert;
  }
}
