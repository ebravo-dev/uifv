import 'package:sqflite/sqflite.dart';

final String tableUser = 'activities';
final String columnId = '_id';
final String columnActividadId = 'actividad_id';
final String columnProductoId = 'producto_id';
final String columnFecha = 'fecha';

class UserActivities {
  int id;
  String actividadId;
  String productoId;
  String fecha;

  Map<String, Object> toMap() {
    var map = <String, Object>{
      columnActividadId: actividadId,
      columnProductoId: productoId,
      columnFecha: fecha,
    };
    if (id != null) {
      map[columnId] = id;
    }
    return map;
  }

  UserActivities({this.id, this.actividadId, this.productoId, this.fecha});

  UserActivities.fromMap(Map<String, Object> map) {
    id = map[columnId];
    actividadId = map[columnActividadId];
    productoId = map[columnProductoId];
    fecha = map[columnFecha];
  }
}

class UserActivitiesProvider {
  Database db;

  Future open(String path) async {
    db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
create table $tableUser ( 
  $columnId integer primary key autoincrement, 
  $columnActividadId text not null,
  $columnProductoId text not null,
  $columnFecha text not null)
''');
    });
  }

  Future<UserActivities> insert(UserActivities user) async {
    user.id = await db.insert(tableUser, user.toMap());
    return user;
  }

  Future<UserActivities> getActivitiesById({int id}) async {
    List<Map> maps = await db.query(tableUser,
        columns: [columnId, columnActividadId, columnProductoId, columnFecha],
        where: '$columnId = ?',
        whereArgs: [id]);
    if (maps.length > 0) {
      return UserActivities.fromMap(maps.first);
    }
    return null;
  }

  Future<List<Map>> getActivities({List<String> productosActivos}) async {
    String argsProductosActivos = '';
    int i = 0;
    for (i = 0; i < productosActivos.length - 1; i++) {
      argsProductosActivos += '?,';
    }
    argsProductosActivos += '?';
    List<Map> actividadesDb = await db.query(
      tableUser,
      columns: [columnId, columnActividadId, columnProductoId, columnFecha],
      where: '$columnProductoId IN ($argsProductosActivos)',
      whereArgs: productosActivos,
    );

    return actividadesDb;
  }

  Future<Map> getActivityState({String idActividad}) async {
    List<Map> targetActivity = await db.query(
      tableUser,
      where: '$columnActividadId = ?',
      whereArgs: [idActividad],
      orderBy: '$columnFecha DESC',
      limit: 1,
    );
    if (targetActivity.isEmpty)
      return {
        'fechaigual': false,
        'cantidad': 0,
      };
    String fecha = targetActivity[0]['fecha'];
    DateTime fechaActividad = DateTime.parse(fecha);
    DateTime currentDate = DateTime.now();

    return {
      'fechaigual': fechaActividad.year == currentDate.year &&
          fechaActividad.month == currentDate.month &&
          fechaActividad.day == currentDate.day,
      'cantidad': 1,
    };
  }

  Future<int> delete(int id) async {
    return await db.delete(tableUser, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<int> update(UserActivities user) async {
    return await db.update(tableUser, user.toMap(),
        where: '$columnId = ?', whereArgs: [user.id]);
  }

  Future close() async => db.close();
}
