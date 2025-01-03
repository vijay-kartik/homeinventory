import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

void setup() {
  // Register Data Sources
  // getIt.registerLazySingleton<SomeDataSource>(() => SomeDataSourceImpl());

  // Register Repositories
  // getIt.registerLazySingleton<SomeRepository>(() => SomeRepositoryImpl(getIt<SomeDataSource>()));

  // Register Use Cases, Services, etc.
  // getIt.registerFactory<SomeUseCase>(() => SomeUseCase(getIt<SomeRepository>()));
} 