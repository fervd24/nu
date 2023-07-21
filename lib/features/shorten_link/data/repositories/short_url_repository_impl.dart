// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dartz/dartz.dart';
import 'package:nu_test1/core/error/failures.dart';
import 'package:nu_test1/features/shorten_link/data/datasources/shorted_url_remote_datasource.dart';
import 'package:nu_test1/features/shorten_link/data/models/short_url_model.dart';
import 'package:nu_test1/features/shorten_link/domain/entities/short_url.dart';
import 'package:nu_test1/features/shorten_link/domain/repositories/short_url_repository.dart';

class ShortUrlRepositoryImpl implements ShortUrlRepository {

  final ShortedUrlRemoteDataSource remoteDataSource;
  
  ShortUrlRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, ShortUrl>>? createShortUrl(String url) async {
    try {
      final remoteShortUrl = await remoteDataSource.createShortUrl(url);
      return Right(remoteShortUrl as ShortUrlModel);
      
    } catch (e) {
      return Left(ServerFailure());
    }
  }


}
