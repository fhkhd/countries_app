import 'dart:convert';

import 'package:dio/dio.dart';
import '../../../../core/error/exceptions.dart';
import '../models/country_model.dart';

abstract interface class CountriesRemoteDataSource {
  Future<List<CountryModel>> getCountries();
}

class CountriesRemoteDataSourceImpl implements CountriesRemoteDataSource {
  final Dio dio;

  CountriesRemoteDataSourceImpl(this.dio);

  @override
  Future<List<CountryModel>> getCountries() async {
    List<CountryModel> countryModels = [];
    try {
      dio.interceptors.add(LogInterceptor(
        requestBody: true,
        responseBody: true,
      ));
      final response = await dio.get(
        'https://raw.githubusercontent.com/PouriaMoradi021/countries-api/refs/heads/main/countries.json',
        options: Options(responseType: ResponseType.plain),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final List<dynamic> jsonList = jsonDecode(response.data);

        for (var country in jsonList) {
          countryModels.add(CountryModel.fromJson(country));
        }
        return countryModels;
      } else {
        throw ServerException("Error : ${response.statusCode}");
      }
    } on DioException catch (e) {
      throw ServerException(e.message);
    }
  }
}
