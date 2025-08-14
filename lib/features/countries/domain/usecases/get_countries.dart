import 'package:countries_app/features/countries/domain/entities/country.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/countries_repository.dart';

class GetCountries implements UseCase<List<Country>, NoParams> {
  final CountriesRepository countriesRepository;

  GetCountries(this.countriesRepository);

  @override
  Future<Either<Failure, List<Country>>> call(NoParams) async {
    return await countriesRepository.getCountries();
  }
}
