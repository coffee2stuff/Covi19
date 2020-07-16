abstract class ApiState {
  const ApiState();
}

class LoadingState extends ApiState {}

class HasDataState extends ApiState {
  final dynamic data;
  HasDataState(this.data);
}

class NoDataState extends ApiState {}

class ErrorState extends ApiState {}
