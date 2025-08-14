part of 'init_dependencies.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  serviceLocator.registerLazySingleton(
    () => Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 5),
      ),
    ),
  );
  _initCountries();
  serviceLocator.registerFactory(() => InternetConnection());

  serviceLocator.registerFactory<ConnectionChecker>(
    () => ConnectionCheckerImpl(
      serviceLocator(),
    ),
  );
}

void _initCountries() {
  // Datasource
  serviceLocator
    ..registerFactory<CountriesRemoteDataSource>(
      () => CountriesRemoteDataSourceImpl(serviceLocator()),
    )
    //   ..registerFactory<CountriesLocalDataSource>(
    //     () => CountriesLocalDataSourceImpl(),
    //   )
    // Repository
    ..registerFactory<CountriesRepository>(
      () => CountriesRepositoryImpl(
        serviceLocator(),
      ),
    )
    // Usecases
    ..registerFactory(
      () => GetCountries(
        serviceLocator(),
      ),
    )
    // Bloc
    ..registerLazySingleton(
      () => CountriesBloc(
        getCountries: serviceLocator(),
      ),
    );
}
