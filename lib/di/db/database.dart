import 'package:osp/di/db/models/building.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class BuildingsDatabase {
  static final BuildingsDatabase instance = BuildingsDatabase._init();

  static Database? _database;

  BuildingsDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('Buildings.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';
    final boolType = 'BOOLEAN NOT NULL';
    final integerType = 'INTEGER NOT NULL';

    await db.execute('''
CREATE TABLE $tableBuildings ( 
  ${BuildingFields.id} $idType, 
  ${BuildingFields.title} $textType,
  ${BuildingFields.latitude} $textType,
  ${BuildingFields.longtitude} $textType,
  ${BuildingFields.description} $textType
  )
''');
  }

  Future<Building> create(Building building) async {
    final db = await instance.database;

    // final json = Building.toJson();
    // final columns =
    //     '${BuildingFields.title}, ${BuildingFields.description}, ${BuildingFields.time}';
    // final values =
    //     '${json[BuildingFields.title]}, ${json[BuildingFields.description]}, ${json[BuildingFields.time]}';
    // final id = await db
    //     .rawInsert('INSERT INTO table_name ($columns) VALUES ($values)');

    final id = await db.insert(tableBuildings, building.toJson());
    return building.copy(id: id);
  }

  Future<Building> readBuilding(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      tableBuildings,
      columns: BuildingFields.values,
      where: '${BuildingFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isEmpty) {
      return Building.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<Building>> readAllBuildings() async {
    final db = await instance.database;

    final orderBy = '${BuildingFields.title} ASC';

    final result = await db.query(tableBuildings, orderBy: orderBy);

    return result.map((json) => Building.fromJson(json)).toList();
  }

  Future<int> update(Building Building) async {
    final db = await instance.database;

    return db.update(
      tableBuildings,
      Building.toJson(),
      where: '${BuildingFields.id} = ?',
      whereArgs: [Building.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;

    return await db.delete(
      tableBuildings,
      where: '${BuildingFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}