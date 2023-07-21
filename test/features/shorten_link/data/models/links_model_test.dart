import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:nu_test1/features/shorten_link/data/models/links_model.dart';
import 'package:nu_test1/features/shorten_link/domain/entities/links.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  const tLinksModel = LinksModel(self: 'www.test.com.mx', short: 'https://url-shortener-server.onrender.com/api/alias/1175941059');
  
  test('should be a subclass of Links entity', () {
    expect(tLinksModel, isA<Links>());
  });

  test('fromJson', () async {
    final Map<String, dynamic> jsonMap = json.decode(fixture('links.json'));
    final result = LinksModel.fromJson(jsonMap);

    expect(result, tLinksModel);
  });

  test('should return a JSON map containing the proper data', () async {
    final result = tLinksModel.toJson();

    final expectedMap = {
      'self': 'www.test.com.mx',
      'short': 'https://url-shortener-server.onrender.com/api/alias/1175941059'
    };

    expect(result, expectedMap);
  });
}