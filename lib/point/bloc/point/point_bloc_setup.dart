part of 'points_bloc.dart';

typedef GetPointDashboardState = DataState<PointDashboardModel>;
typedef AddPointsState = DataState<PointsModel>;

//Events
typedef GetPointsEvent = GetDataEvent<String>;
typedef RefreshPointsEvent = RefreshDataEvent<String>;

class GetTotalPointsEvent extends GetDataEvent<String> {
  GetTotalPointsEvent({super.data = ""});
}

class AddPointsEvent extends AddDataEvent<PointsModel> {
  final BuildContext context;

  AddPointsEvent({required this.context, required super.newData});
}