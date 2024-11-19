import 'package:domain/domain.dart';
import 'package:isar/isar.dart';

part 'points_entity.g.dart';

@collection
class PointsEntity {
  Id? id = Isar.autoIncrement;

  int points;
  DateTime dateTime;

  PointsEntity({
    this.id,
    required this.points,
    required this.dateTime,
  });

  PointsModel toRegularModel() {
    return PointsModel(
      id: id ?? -1,
      points: points,
      dateAdded: dateTime,
    );
  }

  factory PointsEntity.fromRegularModel(PointsModel model) {
    return PointsEntity(
      points: model.points,
      dateTime: model.dateAdded,
    );
  }

}
