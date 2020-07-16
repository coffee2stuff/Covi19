import 'package:covi_19/api/models/summary.model.dart';

abstract class IApiRepository {
  Future<SummaryModel> getSummary();
}
