import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class AppCacheManagers {
  AppCacheManagers._();

  static final countryFlags = CacheManager(
    Config(
      'countryFlagsCache',
      stalePeriod: const Duration(days: 7),
      maxNrOfCacheObjects: 50,
    ),
  );
}
