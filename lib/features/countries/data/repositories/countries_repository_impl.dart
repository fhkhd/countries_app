import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/country.dart';
import '../../domain/repositories/countries_repository.dart';
import '../datasources/countries_remote_data_source.dart';

class CountriesRepositoryImpl implements CountriesRepository {
  final CountriesRemoteDataSource countriesRemoteDataSource;

  CountriesRepositoryImpl(
    this.countriesRemoteDataSource,
  );

  @override
  Future<Either<Failure, List<Country>>> getCountries() async {
    try {
      final countries = await countriesRemoteDataSource.getCountries();
      return right(countries);
    } on DioException catch (e) {
      return left(Failure(e.message));
    }
  }
}
