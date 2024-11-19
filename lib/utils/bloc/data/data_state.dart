import 'package:flutter/cupertino.dart';

@immutable
abstract class DataState<T> {
  final T? data;

  const DataState({this.data});
}

class DataFailureState<T> extends DataState<T> {
  final String message;

  const DataFailureState({required this.message});
}

class DataLoadingState<T> extends DataState<T> {}

class DataRefreshingState<T> extends DataState<T> {}

class InitialDataState<T> extends DataState<T> {
  const InitialDataState() : super(data: null);
}

class SuccessfulDataState<T> extends DataState<T> {
  const SuccessfulDataState({required super.data});
}