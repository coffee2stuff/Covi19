import 'package:covi_19/api/models/summary-country.model.dart';
import 'package:covi_19/api/models/summary-global.model.dart';

class SummaryModel {
  SummaryGlobalModel global;
  List<SummaryCountryModel> countries;

  SummaryModel();

  SummaryModel.from(
    this.global,
    this.countries,
  );

  SummaryModel.fromJson(Map<String, dynamic> json) {
    this.global = SummaryGlobalModel.fromJson(json['Global']);
    this.countries = _constructComponents(json['Countries']);
  }

  List<SummaryCountryModel> _constructComponents(dynamic countries) {
    List<SummaryCountryModel> tmpList = [];
    for (int i = 0; i < countries.length; i++) {
      tmpList.add(SummaryCountryModel.fromJson(countries[i]));
    }
    return tmpList;
  }
}
