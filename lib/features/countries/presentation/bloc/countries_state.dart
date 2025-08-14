part of 'countries_bloc.dart';

@freezed
class CountriesState with _$CountriesState {
  const factory CountriesState.initial() = _Initial;

  const factory CountriesState.loading() = _Loading;

  const factory CountriesState.loaded(List<Country> countries) = _Loaded;

  const factory CountriesState.error(String message) = _Error;
}
