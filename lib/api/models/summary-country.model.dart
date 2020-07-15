class SummaryCountryModel {
  String country;
  String countryCode;
  String slug;
  int newConfirmed;
  int totalConfirmed;
  int newDeaths;
  int totalDeaths;
  int newRecovered;
  int totalRecovered;
  String date;

  SummaryCountryModel();

  SummaryCountryModel.from(
    this.country,
    this.countryCode,
    this.slug,
    this.newConfirmed,
    this.totalConfirmed,
    this.newDeaths,
    this.totalDeaths,
    this.newRecovered,
    this.totalRecovered,
    this.date,
  );

  SummaryCountryModel.fromJson(Map<String, dynamic> json) {
    this.country = json['Country'];
    this.countryCode = json['CountryCode'];
    this.slug = json['Slug'];
    this.newConfirmed = json['NewConfirmed'];
    this.totalConfirmed = json['TotalConfirmed'];
    this.newDeaths = json['NewDeaths'];
    this.totalDeaths = json['TotalDeaths'];
    this.newRecovered = json['NewRecovered'];
    this.totalRecovered = json['TotalRecovered'];
    this.date = json['Date'];
  }
}
