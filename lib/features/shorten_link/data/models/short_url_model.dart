import 'package:nu_test1/features/shorten_link/data/models/links_model.dart';
import 'package:nu_test1/features/shorten_link/domain/entities/short_url.dart';

class ShortUrlModel extends ShortUrl {
  
  const ShortUrlModel({
    required alias,
    required links,
  }) : super (alias: alias, links: links);

  factory ShortUrlModel.fromJson(Map<String, dynamic> json) {
    
    return ShortUrlModel(
      alias: json['alias'],
      links: LinksModel.fromJson(json['_links'])
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "alias": alias,
      "_links": (links as LinksModel).toJson()
    };
  }
}