abstract class ApiEvent {
  const ApiEvent();
}

class AppStartedEvent extends ApiEvent {}

class RequestSummaryEvent extends ApiEvent {}
