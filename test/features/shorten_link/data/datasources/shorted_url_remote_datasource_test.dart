
import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:nu_test1/features/shorten_link/data/datasources/shorted_url_remote_datasource.dart';
import 'package:nu_test1/features/shorten_link/data/models/short_url_model.dart';

import '../../../../fixtures/fixture_reader.dart';
import 'shorted_url_remote_datasource_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  ShortedUrlRemoteDataSourceImpl dataSource;

  final client = MockClient();
  dataSource = ShortedUrlRemoteDataSourceImpl(client: client);

  const url = 'www.test.com.mx';

  group('create short URL', () {
    test('return an ShortUrl if the http call completes successfully', () async {
      when(client.post(
        Uri.https('url-shortener-server.onrender.com', '/api/alias'),
        body: {
          'url': 'www.test.com.mx'
        }
      ))
        .thenAnswer((realInvocation) async => http.Response(fixture('short_url.json'), 200));
    
      final result = await dataSource.createShortUrl(url);
      expect(result , isA<ShortUrlModel>());
    });

    test('successfully', () async {
      final Map<String, dynamic> jsonMap = json.decode(fixture('short_url.json'));
      
      final tShortUrlModel = ShortUrlModel.fromJson(jsonMap);
      when(client.post(
        Uri.https('url-shortener-server.onrender.com', '/api/alias'),
        body: {
          'url': 'www.test.com.mx'
        }
      ))
        .thenAnswer((realInvocation) async => http.Response(fixture('short_url.json'), 200));
    
      final result = await dataSource.createShortUrl(url);
      expect(result , equals(tShortUrlModel));
    });
   });  
}