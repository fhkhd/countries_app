import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failures.dart';
import '../entities/country.dart';

abstract interface class CountriesRepository {
  Future<Either<Failure, List<Country>>> getCountries();
}
