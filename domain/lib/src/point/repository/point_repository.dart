import 'package:domain/domain.dart';

typedef PointsResponse = RepositoryResponse<List<PointsModel>>;
typedef TotalPointsResponse = RepositoryResponse<double>;
typedef AddPointsResponse = RepositoryResponse<PointsModel>;

abstract class PointRepository {

  Future<TotalPointsResponse> getTotalPoints();

  Future<PointsResponse> getAllPoints(String cardNumber);

  Future<AddPointsResponse> addPoints(PointsModel points);
}