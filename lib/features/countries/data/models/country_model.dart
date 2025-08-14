import '../../domain/entities/country.dart';

class CountryModel extends Country {
  CountryModel({
    required super.name,
    required super.capital,
    required super.flag,
    required super.code,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      name: json['name'] ?? 'null',
      capital: json['capital'] ?? 'null',
      flag: json['flag'] ?? 'null',
      code: json['code'] ?? 'null',
    );
  }
}
