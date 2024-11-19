import 'package:flutter/material.dart';

@immutable
abstract class DataEvent {
}

class AddDataEvent <T> extends DataEvent {
  final T newData;

  AddDataEvent({required this.newData});
}

class GetDataEvent <T> extends DataEvent {
  final T? data;

  GetDataEvent({this.data});
}

class RefreshDataEvent<T> extends DataEvent {
  final T? data;

  RefreshDataEvent({this.data});
}