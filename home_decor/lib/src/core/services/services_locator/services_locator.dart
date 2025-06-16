import 'package:get_it/get_it.dart';
import 'package:home_decor/src/core/networks/api_client.dart';
import 'package:home_decor/src/features/home/data/data_sources/remote_data_source.dart';
import 'package:home_decor/src/features/home/data/repositories/repositories_impl.dart';
import 'package:home_decor/src/features/home/domain/repositories/base_repositories.dart';
import 'package:home_decor/src/features/home/domain/use_cases/best_seller_use_case.dart';
import 'package:home_decor/src/features/home/domain/use_cases/categories_use_case.dart';
import 'package:home_decor/src/features/home/domain/use_cases/new_collection_use_case.dart';
import 'package:home_decor/src/features/home/domain/use_cases/slider_use_case.dart';

final sl = GetIt.instance;

class ServicesLocator {
  static void init(){
    sl.registerLazySingleton(() => ApiClient());

    sl.registerLazySingleton<BaseRemoteDataSource>(
      () => RemoteDataSourceImpl(apiClient: sl()),
    );
    sl.registerLazySingleton<BaseRepository>(
      () => RepositoryImpl(remoteDataSource: sl()),
    );
    sl.registerLazySingleton(() => SliderUseCase(repository: sl()));
    sl.registerLazySingleton(() => CategoriesUseCase(repository: sl()));
    sl.registerLazySingleton(() => BestSellerUseCase(repository: sl()));
    sl.registerLazySingleton(() => NewCollectionUseCase(repository: sl()));
  }
}
