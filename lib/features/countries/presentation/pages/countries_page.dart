import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/cache/app_cache_managers.dart';
import '../bloc/countries_bloc.dart';
import '../widgets/country_list_item.dart';

class CountriesPage extends StatefulWidget {
  const CountriesPage({super.key});

  @override
  State<CountriesPage> createState() => _CountriesPage();
}

class _CountriesPage extends State<CountriesPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Countries"),
      ),
      body: BlocConsumer<CountriesBloc, CountriesState>(
          listener: (BuildContext context, CountriesState state) {
        state.maybeWhen(
          error: (message) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(message)),
            );
          },
          orElse: () {},
        );
      }, builder: (BuildContext context, CountriesState state) {
        return state.when(
          initial: () => Center(
            child: ElevatedButton(
              onPressed: () => context
                  .read<CountriesBloc>()
                  .add(const CountriesEvent.loadCountries()),
              child: const Text('Load Countries'),
            ),
          ),
          loading: () => const Center(child: CircularProgressIndicator()),
          loaded: (countries) => CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final country = countries[index];
                    return CountryListItem(
                      country: country,
                      cacheManager: AppCacheManagers.countryFlags,
                    );
                  },
                  childCount: countries.length,
                ),
              ),
            ],
          ),
          error: (message) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(message, style: const TextStyle(color: Colors.red)),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () => context
                      .read<CountriesBloc>()
                      .add(const CountriesEvent.loadCountries()),
                  child: const Text('Retry'),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
