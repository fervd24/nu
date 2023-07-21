// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'short_url_bloc.dart';

abstract class ShortUrlState extends Equatable {
  const ShortUrlState();
  
  @override
  List<Object> get props => [];
}


class ShortUrlListed extends ShortUrlState {
  final ShortUrl shortUrl;
  final Set<ShortUrl> shortUrls;

  const ShortUrlListed({
    required this.shortUrl,
    required this.shortUrls,
  });

  @override
  List<Object> get props => [shortUrl];
}

class ErrorState extends ShortUrlState {
  final String message;

  const ErrorState({required this.message});

  @override
  List<Object> get props => [message];
}
