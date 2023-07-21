
// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:nu_test1/core/error/failures.dart';
import 'package:nu_test1/core/usecases/usecase.dart';
import 'package:nu_test1/features/shorten_link/domain/entities/short_url.dart';
import 'package:nu_test1/features/shorten_link/domain/repositories/short_url_repository.dart';

class CreateShortUrl implements UseCase<ShortUrl, Params>{
  final ShortUrlRepository repository;

  const CreateShortUrl({
    required this.repository,
  });

  @override
  Future<Either<Failure, ShortUrl>?> call(Params params) async {
    return await repository.createShortUrl(params.url);
  }
}

class Params extends Equatable {
  final String url;

  const Params({required this.url});

  @override
  List<Object> get props => [url];
}