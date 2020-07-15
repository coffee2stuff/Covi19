class SummaryGlobalModel {
  int newConfirmed;
  int totalConfirmed;
  int newDeaths;
  int totalDeaths;
  int newRecovered;
  int totalRecovered;

  SummaryGlobalModel();

  SummaryGlobalModel.from(
    this.newConfirmed,
    this.totalConfirmed,
    this.newDeaths,
    this.totalDeaths,
    this.newRecovered,
    this.totalRecovered,
  );

  SummaryGlobalModel.fromJson(Map<String, dynamic> json) {
    this.newConfirmed = json['NewConfirmed'];
    this.totalConfirmed = json['TotalConfirmed'];
    this.newDeaths = json['NewDeaths'];
    this.totalDeaths = json['TotalDeaths'];
    this.newRecovered = json['NewRecovered'];
    this.totalRecovered = json['TotalRecovered'];
  }
}
