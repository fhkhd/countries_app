import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

import 'core/network/connection_checker.dart';
import 'features/countries/data/datasources/countries_remote_data_source.dart';
import 'features/countries/data/repositories/countries_repository_impl.dart';
import 'features/countries/domain/repositories/countries_repository.dart';
import 'features/countries/domain/usecases/get_countries.dart';
import 'features/countries/presentation/bloc/countries_bloc.dart';


part 'init_dependencies.main.dart';
