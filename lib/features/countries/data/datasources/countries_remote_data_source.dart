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
    try {
      final response = await dio.get(
        'https://raw.githubusercontent.com/PouriaMoradi021/countries-api/refs/heads/main/countries.json',
        options: Options(responseType: ResponseType.plain),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final List<dynamic> jsonList = jsonDecode(response.data);
        return jsonList
            .map((country) => CountryModel.fromJson(country))
            .toList();
      } else {
        throw ServerException("Bad response: ${response.statusCode}");
      }
    } on DioException catch (e) {
      switch (e.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
          throw const TimeoutException("Connection timed out");

        case DioExceptionType.badResponse:
          throw ServerException("Bad response: ${e.response?.statusCode}");

        case DioExceptionType.connectionError:
          throw const NetworkException("No internet connection");

        case DioExceptionType.cancel:
          throw const NetworkException("Request was cancelled");

        case DioExceptionType.unknown:
        default:
          throw UnknownException(e.message ?? "Unknown error");
      }
    } catch (e) {
      throw UnknownException(e.toString());
    }
  }
}
