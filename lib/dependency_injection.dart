import 'package:dcit24/data/logic/remote_datasource.dart';
import 'package:dcit24/data/repository/repository_impl.dart';
import 'package:dcit24/domain/repository/repository.dart';
import 'package:dcit24/domain/usecases/add_prulife.dart';
import 'package:dcit24/domain/usecases/fetch_prulife.dart';
import 'package:dcit24/presentation/state_management/prulife/prulife_cubit.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future init() async {
  sl.registerFactory(() => PrulifeCubit(sl(), sl()));
  sl.registerLazySingleton(() => AddPrulife(repo: sl()));
  sl.registerLazySingleton(() => FetchPrulife(repo: sl()));
  sl.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl());
  sl.registerLazySingleton<Repository>(() => RepositoryImpl(remote: sl()));
}
