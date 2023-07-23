
import 'package:dartz/dartz.dart';
import 'package:nu_test1/core/error/failures.dart';
import 'package:nu_test1/features/shorten_link/domain/entities/short_url.dart';

abstract class ShortUrlRepository {
  Future<Either<Failure, ShortUrl>>? createShortUrl(String url);
}