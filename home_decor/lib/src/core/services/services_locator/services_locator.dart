import 'package:get_it/get_it.dart';
import 'package:home_decor/src/core/networks/api_client.dart';
import 'package:home_decor/src/features/auth/data/data_sources/base_remote_data_source/base_login_remote_data_source.dart';
import 'package:home_decor/src/features/auth/data/data_sources/base_remote_data_source/base_register_remote_data_source.dart';
import 'package:home_decor/src/features/auth/data/data_sources/remote_data_source_impl/login_remote_data_source_impl.dart';
import 'package:home_decor/src/features/auth/data/data_sources/remote_data_source_impl/register_remote_data_source.dart';
import 'package:home_decor/src/features/auth/data/repositories/login_repo_impl.dart';
import 'package:home_decor/src/features/auth/data/repositories/register_repo_impl.dart';
import 'package:home_decor/src/features/auth/domain/repositories/base_login_repo.dart';
import 'package:home_decor/src/features/auth/domain/repositories/base_register_repo.dart';
import 'package:home_decor/src/features/auth/domain/use_cases/login_use_case.dart';
import 'package:home_decor/src/features/auth/domain/use_cases/register_use_case.dart';
import 'package:home_decor/src/features/home/data/data_sources/base_remote_data_source/base_best_seller_remote_data_source.dart';
import 'package:home_decor/src/features/home/data/data_sources/base_remote_data_source/base_categories_remote_data_source.dart';
import 'package:home_decor/src/features/home/data/data_sources/base_remote_data_source/base_new_collections_remote_data_source.dart';
import 'package:home_decor/src/features/home/data/data_sources/base_remote_data_source/base_slider_remote_data_source.dart';
import 'package:home_decor/src/features/home/data/data_sources/remote_data_source_impl/best_seller_remote_data_source_impl.dart';
import 'package:home_decor/src/features/home/data/data_sources/remote_data_source_impl/categories_remote_data_source_impl.dart';
import 'package:home_decor/src/features/home/data/data_sources/remote_data_source_impl/new_collections_remote_data_source.dart';
import 'package:home_decor/src/features/home/data/data_sources/remote_data_source_impl/slider_remote_data_source_impl.dart';
import 'package:home_decor/src/features/home/data/repositories/best_seller_repo_impl.dart';
import 'package:home_decor/src/features/home/data/repositories/categories_repo_impl.dart';
import 'package:home_decor/src/features/home/data/repositories/new_collections_repo_impl.dart';
import 'package:home_decor/src/features/home/data/repositories/slider_repo_impl.dart';
import 'package:home_decor/src/features/home/domain/repositories/base_bestseller_repository.dart';
import 'package:home_decor/src/features/home/domain/repositories/base_categories_repository.dart';
import 'package:home_decor/src/features/home/domain/repositories/base_new_collections_repository.dart';
import 'package:home_decor/src/features/home/domain/repositories/base_slider_repository.dart';
import 'package:home_decor/src/features/home/domain/use_cases/best_seller_use_case.dart';
import 'package:home_decor/src/features/home/domain/use_cases/categories_use_case.dart';
import 'package:home_decor/src/features/home/domain/use_cases/new_collection_use_case.dart';
import 'package:home_decor/src/features/home/domain/use_cases/slider_use_case.dart';
import 'package:home_decor/src/features/search/data/data_sources/base_remote_data_source/base_api_setting_remote_data_source.dart';
import 'package:home_decor/src/features/search/data/data_sources/base_remote_data_source/base_search_remote_data_source.dart';
import 'package:home_decor/src/features/search/data/data_sources/remote_data_source_impl/api_setting_remote_data_source_impl.dart';
import 'package:home_decor/src/features/search/data/data_sources/remote_data_source_impl/search_remote_data_source_impl.dart';
import 'package:home_decor/src/features/search/data/repositories/api_setting_repo_impl.dart';
import 'package:home_decor/src/features/search/data/repositories/search_repo_impl.dart';
import 'package:home_decor/src/features/search/domain/repositories/base_api_setting_repo.dart';
import 'package:home_decor/src/features/search/domain/repositories/base_search_repo.dart';
import 'package:home_decor/src/features/search/domain/use_cases/api_setting_use_case.dart';
import 'package:home_decor/src/features/search/domain/use_cases/search_use_case.dart';

final sl = GetIt.instance;

class ServicesLocator {
  static void init(){
    // api
    sl.registerLazySingleton(() => ApiClient());

    // Auth Remote Data Sources
    sl.registerLazySingleton<BaseRegisterRemoteDataSource>(()=>RegisterRemoteDataSourceImpl(apiClient: sl(),));
    sl.registerLazySingleton<BaseLoginRemoteDataSource>(()=>LoginRemoteDataSourceImpl(apiClient: sl(),));

    // Auth Repositories
    sl.registerLazySingleton<BaseRegisterRepository>(()=>RegisterRepoImpl(registerRemoteDataSource: sl(),));
    sl.registerLazySingleton<BaseLoginRepository>(()=>LoginRepoImpl(loginRemoteDataSource: sl(),));

    // Auth UseCases
    sl.registerLazySingleton<RegisterUseCase>(()=>RegisterUseCase(registerRepository: sl()));
    sl.registerLazySingleton<LoginUseCase>(()=>LoginUseCase(loginRepository: sl()));


    // Home Remote Data Sources
    sl.registerLazySingleton<BaseSliderRemoteDataSource>(() => SliderRemoteDataSourceImpl(apiClient: sl()),);
    sl.registerLazySingleton<BaseCategoriesRemoteDataSource>(() => CategoriesRemoteDataSourceImpl(apiClient: sl()),);
    sl.registerLazySingleton<BaseBestSellerRemoteDataSource>(() => BestSellerRemoteDataSourceImpl(apiClient: sl()),);
    sl.registerLazySingleton<BaseNewCollectionsRemoteDataSource>(() => NewCollectionsRemoteDataSource(apiClient: sl()),);


    // Home Repositories
    sl.registerLazySingleton<BaseSliderRepository>(() => SliderRepoImpl(remoteDataSource: sl()),);
    sl.registerLazySingleton<BaseCategoriesRepository>(() => CategoriesRepoImpl(remoteDataSource: sl()),);
    sl.registerLazySingleton<BaseBestSellerRepository>(() => BestSellerRepoImpl(remoteDataSource: sl()),);
    sl.registerLazySingleton<BaseNewCollectionsRepository>(() => NewCollectionsRepoImpl(remoteDataSource: sl()),);

    // Home UseCases
    sl.registerLazySingleton<SliderUseCase>(() => SliderUseCase(repository: sl()));
    sl.registerLazySingleton<CategoriesUseCase>(() => CategoriesUseCase(repository: sl()));
    sl.registerLazySingleton<BestSellerUseCase>(() => BestSellerUseCase(repository: sl()));
    sl.registerLazySingleton<NewCollectionUseCase>(() => NewCollectionUseCase(repository: sl()));

    // search Remote Data Source
    sl.registerLazySingleton<BaseSearchRemoteDataSource>(() => SearchRemoteDataSourceImpl(apiClient: sl()),);

    // search Repositories
    sl.registerLazySingleton<BaseSearchRepo>(() => SearchRepoImpl(searchRemoteDataSource: sl()),);

    // search useCase
    sl.registerLazySingleton<SearchUseCase>(() => SearchUseCase(searchRepo: sl()));

    // apiSetting Remote Data Source
    sl.registerLazySingleton<BaseApiSettingRemoteDataSource>(() => ApiSettingRemoteDataSourceImpl(apiClient: sl()),);

    // search Repositories
    sl.registerLazySingleton<BaseApiSettingRepo>(() => ApiSettingRepoImpl(apiSettingRemoteDataSource: sl()),);

    // search useCase
    sl.registerLazySingleton<ApiSettingUseCase>(() => ApiSettingUseCase(apiSettingRepo: sl()));






  }
}
