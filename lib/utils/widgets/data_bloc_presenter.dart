import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grape_card/error/view/error_screen.dart';
import 'package:grape_card/utils/bloc/data/data_state.dart';

typedef DataBlockBuilder<D> = Widget Function(BuildContext context, D data);
typedef DataInitBlockBuilder = Widget Function(BuildContext context);

///Wraps all the DataState cases and manages each situation
class DataBlocPresenter<B extends StateStreamable<DataState<DataType>>,
    DataType> extends StatelessWidget {
  /// The [viewBuilder] function is called when Data was retrieve successfully
  final DataBlockBuilder<DataType> viewBuilder;

  /// The [initViewBuilder] function is called when block hasn't been called yet
  final DataInitBlockBuilder? initViewBuilder;

  /// Manages all the default states of the Data cases
  const DataBlocPresenter({
    super.key,
    required this.viewBuilder,
    this.initViewBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<B, DataState<DataType>>(
      builder: (context, state) {
        if (state is InitialDataState) {
          if (initViewBuilder == null) {
            return const Center(child: CircularProgressIndicator());
          }
          return initViewBuilder!(context);
        } else if (state is DataLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is DataFailureState) {
          final st = state as DataFailureState;
          return ErrorScreen(message: st.message);
        } else if (state is SuccessfulDataState && state.data != null) {
          return viewBuilder(context, state.data as DataType);
        } else if (state is DataRefreshingState && state.data != null) {
          return _refreshingData(context, state.data as DataType);
        }

        return const ErrorScreen(
            message:
                'Unknown error has occurred. Please contact your provider');
      },
    );
  }

  Stack _refreshingData(BuildContext context, DataType data) {
    return Stack(
      children: [
        viewBuilder(context, data),
        Positioned.fill(
            child: ColoredBox(
              color: Colors.black.withOpacity(0.4),
              child: const CircularProgressIndicator(),
            ))
      ],
    );
  }
}
