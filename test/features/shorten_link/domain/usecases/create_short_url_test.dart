import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:nu_test1/features/shorten_link/domain/entities/links.dart';
import 'package:nu_test1/features/shorten_link/domain/entities/short_url.dart';
import 'package:nu_test1/features/shorten_link/domain/repositories/short_url_repository.dart';
import 'package:nu_test1/features/shorten_link/domain/usecases/create_short_url.dart';

class MockShortUrlRepository extends Mock implements ShortUrlRepository{}

void main() {
  late CreateShortUrl usecase;
  late ShortUrlRepository mockShortUrlRepository;

  setUp(() {
    mockShortUrlRepository = MockShortUrlRepository();
    usecase = CreateShortUrl(repository: mockShortUrlRepository);

  });

  const tUrl = 'www.test.com.mx';
  const Links tLinks = Links(self: 'www.test.com.mx', short: 'https://url-shortener-server.onrender.com/api/alias/1175941059');
  const tShortedUrl = ShortUrl(alias: '1175941059', links: tLinks);
  
  test('should create and return new shorted link', () async {
    when(mockShortUrlRepository.createShortUrl(tUrl))
      .thenAnswer((_) async => const Right(tShortedUrl));

    final result = await usecase(const Params(url: tUrl));

    expect(result, const Right(tShortedUrl));
    verify(mockShortUrlRepository.createShortUrl(tUrl));
    verifyNoMoreInteractions(mockShortUrlRepository);
  });

}