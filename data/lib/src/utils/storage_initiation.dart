import 'package:data/src/point/entity/points_entity.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';


class Storage {
  static final Storage _dataBase = Storage._internal();

  factory Storage() {
    return _dataBase;
  }

  Storage._internal();

  late final Isar isar;

  Future<void> initializedStorage() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open([PointsEntitySchema], directory: dir.path);
  }

}