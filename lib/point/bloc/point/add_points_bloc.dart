import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grape_card/config/dependency_injection_config.dart';
import 'package:grape_card/point/bloc/point/points_bloc.dart';
import 'package:grape_card/utils/bloc/data/data_event.dart';
import 'package:grape_card/utils/bloc/data/data_state.dart';

class AddPointsBloc extends Bloc<DataEvent, AddPointsState> {
  late final PointRepository _repository;

  AddPointsBloc({PointRepository? repository}) : super(const InitialDataState()) {
    _repository = repository ?? getIt.get();
    on<AddPointsEvent>(_addPoints);
    on<RefreshDataEvent<PointsModel>>(_refreshScreen);
  }

  void _addPoints(AddPointsEvent event, Emitter<AddPointsState> emitter) async {
    emitter.call(DataLoadingState());

    final response = await _repository.addPoints(event.newData);

    if (response.hasError) {
      emitter.call(
        DataFailureState(message: response.error ?? 'Unknown Error'),
      );
      return;
    }
    emitter.call(
      SuccessfulDataState(
        data: response.data
      ),
    );


  }

  void _refreshScreen(RefreshDataEvent<PointsModel> event, Emitter<AddPointsState> emitter) async {
    emitter.call(const InitialDataState());
  }
}
