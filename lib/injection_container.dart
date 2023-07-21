
import 'package:get_it/get_it.dart';
import 'package:nu_test1/features/shorten_link/data/datasources/shorted_url_remote_datasource.dart';
import 'package:nu_test1/features/shorten_link/data/repositories/short_url_repository_impl.dart';
import 'package:nu_test1/features/shorten_link/domain/repositories/short_url_repository.dart';
import 'package:nu_test1/features/shorten_link/domain/usecases/create_short_url.dart';
import 'package:nu_test1/features/shorten_link/presentation/bloc/short_url_bloc.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> init() async {
  //Bloc
  sl.registerFactory(() => ShortUrlBloc(
    createShortUrl: sl()
  ));

  //Usecases
  sl.registerLazySingleton(() => CreateShortUrl(repository: sl()));
  
  //Repository
  sl.registerLazySingleton<ShortUrlRepository>(
    () => ShortUrlRepositoryImpl(remoteDataSource: sl())
  );

  //Datasources
  sl.registerLazySingleton<ShortedUrlRemoteDataSource>(
    () => ShortedUrlRemoteDataSourceImpl(client: sl())
  );

  //External
  sl.registerLazySingleton(() => http.Client());
}