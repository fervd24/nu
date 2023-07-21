// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:nu_test1/features/shorten_link/domain/entities/links.dart';

class LinksModel extends Links {
  
  const LinksModel({
    required self,
    required short,
  }) : super (self: self, short: short);

  factory LinksModel.fromJson(Map<String, dynamic> json) {
    return LinksModel(
      self: json['self'], 
      short: json['short']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "self": self,
      "short": short
    };
  }
}
