import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:nu_test1/features/shorten_link/data/models/links_model.dart';
import 'package:nu_test1/features/shorten_link/data/models/short_url_model.dart';
import 'package:nu_test1/features/shorten_link/domain/entities/short_url.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  const tLinksModel = LinksModel(self: 'www.test.com.mx', short: 'https://url-shortener-server.onrender.com/api/alias/1175941059');
  const tShortUrlModel = ShortUrlModel(alias: '1175941059', links: tLinksModel);
  test('should be a subclass of Links entity', () {
    expect(tShortUrlModel, isA<ShortUrl>());
  });

  test('fromJson', () async {
    final Map<String, dynamic> jsonMap = json.decode(fixture('short_url.json'));
    
    final result = ShortUrlModel.fromJson(jsonMap);

    expect(result, tShortUrlModel);
  });

  test('toJson', () async {
    
    final result = tShortUrlModel.toJson();

    final expectedMap = {
      "alias": "1175941059",
      "_links": {
        "self": "www.test.com.mx",
        "short": "https://url-shortener-server.onrender.com/api/alias/1175941059"
      }
    };

    expect(result, expectedMap);
  });
}