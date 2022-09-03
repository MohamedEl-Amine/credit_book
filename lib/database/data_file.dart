import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Sqflite {
  static Database? _db;

  Future<Database?> get db async {
    if (_db == null) {
      _db = await intialDatabase();
      return _db;
    } else {
      return _db;
    }
  }

  intialDatabase() async {
    String dataBasePath = await getDatabasesPath();
    String path = join(dataBasePath, 'database.db');
    Database mydb = await openDatabase(path,
        onCreate: _onCreate, version: 8, onUpgrade: _onUpgrade);
    // if we create a table and in future you want to update you cant directly
    // you must change the version and add the function _Onupdate
    return mydb;
  }

  _onUpgrade(Database db, int oldversion, int newversion) {
    print("------ On upgrade is running");
  }

  _onCreate(Database db, int version) async {
    Batch batch = db.batch();

    batch.execute('''
CREATE TABLE "alimentation" (
  "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  "amount" TEXT NOT NULL,
  "date" TEXT NOT NULL
)
''');
    batch.execute('''
CREATE TABLE "totalamountalimentation" (
  "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  "totalamount" TEXT NOT NULL
)
''');
    batch.execute('''
CREATE TABLE "totalamountlegume" (
  "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  "totalamount" TEXT NOT NULL
)
''');
    batch.execute('''
CREATE TABLE "totalamountboucher" (
  "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  "totalamount" TEXT NOT NULL
)
''');
    batch.execute('''
CREATE TABLE "legume" (
  "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  "amount" TEXT NOT NULL,
  "date" TEXT NOT NULL
)
''');
    batch.execute('''
CREATE TABLE "boucher" (
  "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  "amount" TEXT NOT NULL,
  "date" TEXT NOT NULL
)
''');
    batch.commit();
    print('create has succesfully');
  }

  readData(String sql) async {
    Database? mydb = await db;
    List<Map> response = await mydb!.rawQuery(sql);
    return response;
  }

  deletData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawDelete(sql);
    print("done delete");
    return response;
  }

  updateData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawUpdate(sql);
    print("done update");
    return response;
  }

  insertData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawInsert(sql);
    print("done insert");
    return response;
  }

  deleteallDatabase() async {
    // this function for delete all database
    String dataBasePath = await getDatabasesPath();
    String path = join(dataBasePath, 'database.db');
    await deleteDatabase(path);
    print("done formating");
  }
}
