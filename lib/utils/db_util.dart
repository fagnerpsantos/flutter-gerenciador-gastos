import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

class DbUtil {
  static Future<sql.Database> database() async {
    final dbPath = await sql.getDatabasesPath();
    return sql.openDatabase(
      path.join(dbPath, 'gerenciador_gastos.db'),
      onCreate: (db, version) {
        _createDb(db);
      },
      version: 1,
    );
  }
  static void _createDb(sql.Database db) {
    db.execute("""CREATE TABLE conta (id INTEGER PRIMARY KEY AUTOINCREMENT, 
        titulo VARCHAR(50), saldo REAL)"""
    );
    db.execute("""CREATE TABLE transacao (id INTEGER PRIMARY KEY AUTOINCREMENT, 
        tipo INTEGER, titulo VARCHAR(50), descricao VARCHAR(50), data DATETIME, 
        valor REAL, conta INTEGER,
        FOREIGN KEY (conta) REFERENCES conta (id) ON DELETE NO ACTION ON UPDATE NO ACTION)"""
    );
  }
  static Future<void> insertData(String table, Map<String, Object> dados) async{
    final db = await DbUtil.database();
    await db.insert(table, dados,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
  }

  static Future<List<Map<String, dynamic>>> getData(String table) async {
    final db = await DbUtil.database();
    return db.query(table);
  }

  static Future<List<Map<String, dynamic>>> getDataId(String table, List<String>
  columnsToSelect, String whereString, List<dynamic> whereArguments) async {
    final db = await DbUtil.database();
    return db.query(table, columns: columnsToSelect,
        where: whereString,
        whereArgs: whereArguments);
  }

  static Future<List> getDataWhere(String table, String whereString,
      List<dynamic> whereArguments) async {
    final db = await DbUtil.database();
    final maps = await db.query(
      table,
      where: whereString,
      whereArgs: whereArguments,
    );
    return maps.toList();
  }

  static Future<void> editData(String table, Map<String, Object> dados,
      String whereString, List<dynamic> whereArguments) async {
        final db = await DbUtil.database();
        await db.update(table, dados,
            where: whereString,
            whereArgs: whereArguments);
      }
      
  static Future<void> executeSQL(String sql, List<dynamic> arguments) async {
    final db = await DbUtil.database();
    db.rawUpdate(sql, arguments);
  }

}