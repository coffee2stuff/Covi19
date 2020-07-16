import 'package:covi_19/api/models/summary.model.dart';
import 'package:covi_19/api/providers/api.provider.dart';
import 'package:covi_19/api/repositories/iapi.repository.dart';
import 'package:covi_19/utils/constants/api.const.dart';

class ApiRepository implements IApiRepository {
  final ApiProvider _provider = ApiProvider.instance;

  @override
  Future<SummaryModel> getSummary() async {
    dynamic response = await _provider.createGetRequest(SUMMARY);
    return SummaryModel.fromJson(response);
  }
}
