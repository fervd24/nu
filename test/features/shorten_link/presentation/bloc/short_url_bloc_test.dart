
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:nu_test1/features/shorten_link/domain/entities/links.dart';
import 'package:nu_test1/features/shorten_link/domain/entities/short_url.dart';
import 'package:nu_test1/features/shorten_link/domain/usecases/create_short_url.dart';
import 'package:nu_test1/features/shorten_link/presentation/bloc/short_url_bloc.dart';

import 'short_url_bloc_test.mocks.dart';

@GenerateMocks([CreateShortUrl])
void main() {
  ShortUrlBloc bloc;
  MockCreateShortUrl mockCreateShortUrl;

  mockCreateShortUrl = MockCreateShortUrl();

  bloc = ShortUrlBloc(createShortUrl: mockCreateShortUrl);

  const Links tLinks = Links(self: 'www.test.com', short: "https://url-shortener-server.onrender.com/api/alias/1209625444");
  const ShortUrl shortUrl = ShortUrl(alias: '1209625444', links: tLinks);
  const tUrl = 'www.test.com';
  test('should create short urls from the concrete use case ', () async {
    when(mockCreateShortUrl(const Params(url: tUrl)))
      .thenAnswer((_) async => const Right(shortUrl));

    bloc.add(const CreateShortUrlEvent(url: tUrl));
    await untilCalled(mockCreateShortUrl(const Params(url: 'www.test.com'))); 

    verify(mockCreateShortUrl(const Params(url: tUrl)));
  });
}