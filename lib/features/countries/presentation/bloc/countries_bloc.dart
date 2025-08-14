import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/usecase/usecase.dart';
import '../../domain/entities/country.dart';
import '../../domain/usecases/get_countries.dart';

part 'countries_event.dart';

part 'countries_state.dart';

part 'countries_bloc.freezed.dart';

class CountriesBloc extends Bloc<CountriesEvent, CountriesState> {
  final GetCountries _getCountries;

  CountriesBloc({required GetCountries getCountries})
      : _getCountries = getCountries,
        super(const CountriesState.initial()) {
    on<CountriesEvent>((event, emit) async {
      await event.map(
        loadCountries: (_) async {
          emit(const CountriesState.loading());
          final countries = await _getCountries(NoParams());
          countries.fold(
            (l) => emit(CountriesState.error(l.message.toString())),
            (r) => emit(CountriesState.loaded(r)),
          );
        },
      );
    });
  }
}
