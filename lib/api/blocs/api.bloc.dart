import 'package:covi_19/api/blocs/api-event.dart';
import 'package:covi_19/api/blocs/api-state.dart';
import 'package:covi_19/api/models/summary.model.dart';
import 'package:covi_19/api/repositories/api.repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ApiBloc extends Bloc<ApiEvent, ApiState> {
  ApiRepository _repository = ApiRepository();

  ApiBloc() : super(LoadingState());

  @override
  Stream<ApiState> mapEventToState(ApiEvent event) async* {
    if (event is RequestSummaryEvent) {
      SummaryModel summary = await _repository.getSummary();
      yield summary != null ? HasDataState(summary) : ErrorState();
    } else {
      yield ErrorState();
    }
  }
}
