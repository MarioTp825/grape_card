import 'package:domain/domain.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grape_card/config/dependency_injection_config.dart';
import 'package:grape_card/utils/bloc/data/data_event.dart';
import 'package:grape_card/utils/bloc/data/data_state.dart';

part 'point_bloc_setup.dart';

class PointsBloc extends Bloc<DataEvent, GetPointDashboardState> {
  late final PointRepository _repository;

  PointsBloc({PointRepository? repository}) : super(const InitialDataState()) {
    _repository = repository ?? getIt.get();
    on<GetPointsEvent>(_getAllPoints);
    on<GetTotalPointsEvent>(_getAllPoints);
    on<RefreshPointsEvent>(_refreshPoints);
  }

  void _getAllPoints(
      GetPointsEvent event, Emitter<GetPointDashboardState> emitter) async {
    emitter.call(DataLoadingState());

    final result = await _repository.getAllPoints("");

    if (result.error != null || result.data == null) {
      emitter.call(DataFailureState(message: result.error ?? "Unknown error"));
      return;
    }

    if(result.data?.isEmpty == true) {
      emitter.call(SuccessfulDataState(
        data: PointDashboardModel(pointsHistory: [])
      ));
      return;
    }

    emitter.call(
      SuccessfulDataState(
        data: PointDashboardModel(
            pointsHistory: result.data ?? [],
            totalPoints:
                result.data?.map((e) => e.points).reduce((acc, e) => acc + e) ??
                    0),
      ),
    );
  }

  void _refreshPoints(
      RefreshPointsEvent event, Emitter<GetPointDashboardState> emitter) async {
    emitter.call(DataRefreshingState());
    final result = await _repository.getAllPoints("");

    if (result.error != null || result.data == null) {
      emitter.call(DataFailureState(message: result.error ?? "Unknown error"));
      return;
    }

    emitter.call(
      SuccessfulDataState(
        data: PointDashboardModel(
            pointsHistory: result.data ?? [],
            totalPoints:
                result.data?.map((e) => e.points).reduce((acc, e) => acc + e) ??
                    0),
      ),
    );
  }
}
