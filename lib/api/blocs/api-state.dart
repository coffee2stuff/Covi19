import 'package:covi_19/api/models/summary.model.dart';

abstract class ApiState {
  const ApiState();
}

class LoadingState extends ApiState {}

class HasDataState extends ApiState {
  final SummaryModel data;
  HasDataState(this.data);
}

class ErrorState extends ApiState {}
