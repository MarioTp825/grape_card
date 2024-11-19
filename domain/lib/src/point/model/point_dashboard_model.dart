import 'package:domain/domain.dart';

class PointDashboardModel {
  int totalPoints;
  final List<PointsModel> pointsHistory;

  PointDashboardModel({required this.pointsHistory, this.totalPoints = 0});
}