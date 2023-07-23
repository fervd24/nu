
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:nu_test1/core/error/exceptions.dart';
import 'package:nu_test1/core/error/failures.dart';
import 'package:nu_test1/features/shorten_link/data/datasources/shorted_url_remote_datasource.dart';
import 'package:nu_test1/features/shorten_link/data/models/links_model.dart';
import 'package:nu_test1/features/shorten_link/data/models/short_url_model.dart';
import 'package:nu_test1/features/shorten_link/data/repositories/short_url_repository_impl.dart';
import 'package:nu_test1/features/shorten_link/domain/entities/short_url.dart';

import 'short_url_repository_impl_test.mocks.dart';

@GenerateMocks([ShortedUrlRemoteDataSource])
void main() {
  late ShortedUrlRemoteDataSource mockDataSource;
  late ShortUrlRepositoryImpl repository;

  setUp(() {
    mockDataSource = MockShortedUrlRemoteDataSource();
    repository = ShortUrlRepositoryImpl(
      remoteDataSource: mockDataSource
    );
  });

  group('createShortUrl', () { 

    const url = 'www.test.com';
    const tLinksModel = LinksModel(self: 'www.test.com', short: '');
    const tShortUrlModel = ShortUrlModel(alias: url, links: tLinksModel);
    const ShortUrl tShortUrl = tShortUrlModel;

    test('should return ShortUrl type', () async {
      when(mockDataSource.createShortUrl('www.test.com'))
        .thenAnswer((_) async => tShortUrlModel);

      final result = await repository.createShortUrl(url);

      verify(mockDataSource.createShortUrl(url));
      expect(result, equals(const Right(tShortUrl)));
    });

    test(
        'should return server failure when the call to remote data source is unsuccessful',
        () async {
          
          when(mockDataSource.createShortUrl('www.test.com'))
              .thenThrow(ServerException());
          
          final result = await repository.createShortUrl(url);
          
          verify(mockDataSource.createShortUrl(url));
          expect(result, equals(Left(ServerFailure())));
        },
      );
  });
}