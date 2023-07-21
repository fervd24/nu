import 'package:equatable/equatable.dart';
import 'package:nu_test1/features/shorten_link/domain/entities/links.dart';

class ShortUrl extends Equatable{
  final String alias;
  final Links? links;

  const ShortUrl({
    required this.alias, 
    required this.links
  });
  
  @override
  List<Object?> get props => [alias, links];

}