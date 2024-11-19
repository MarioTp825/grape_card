import 'package:data/src/point/entity/points_entity.dart';
import 'package:data/src/utils/storage_initiation.dart';
import 'package:domain/domain.dart';
import 'package:isar/isar.dart';

class PointRepositoryImpl extends PointRepository {
  final isar = Storage().isar;

  @override
  Future<AddPointsResponse> addPoints(PointsModel points) async {
    final entity = PointsEntity.fromRegularModel(points);
    await isar.writeTxn(() async {
      await isar.pointsEntitys.put(entity);
    });
    return RepositoryResponse(
      data: points,
    );
  }

  @override
  Future<PointsResponse> getAllPoints(String cardNumber) async {
    final points = await isar.pointsEntitys.where().findAll();
    return RepositoryResponse(
      data: points.map((e) => e.toRegularModel()).toList(),
    );
  }

  @override
  Future<TotalPointsResponse> getTotalPoints() async {
    final points = await isar.pointsEntitys.where().findAll();
    final total = points.map((e) => e.points).reduce((acc, pts) => acc + pts);
    return RepositoryResponse(data: total.toDouble());
  }
}
