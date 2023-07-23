// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:nu_test1/core/error/exceptions.dart';

import 'package:nu_test1/features/shorten_link/data/models/short_url_model.dart';


abstract class ShortedUrlRemoteDataSource {
  Future<ShortUrlModel?> createShortUrl(String url);
}

class ShortedUrlRemoteDataSourceImpl implements ShortedUrlRemoteDataSource {
  
  final http.Client client;
  

  ShortedUrlRemoteDataSourceImpl({
    required this.client,
  });
  
  @override
  Future<ShortUrlModel?> createShortUrl(String url) async {
    
    await dotenv.load(fileName: ".env");
    final response = await client.post(
      Uri.https(dotenv.env["URL"]!, dotenv.env["PATH"]!),
      headers: {
        "Content-type": dotenv.env["CONTENT_TYPE_HEADER"]!, 
        "Accept": dotenv.env["ACCEPT_HEADER"]!,
      },
      body: jsonEncode({
        "url": url
      })
    );

    if(response.statusCode == 200) {
      return ShortUrlModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

 
}
