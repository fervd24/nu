// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'short_url_bloc.dart';

abstract class ShortUrlEvent extends Equatable {
  const ShortUrlEvent();

  @override
  List<Object> get props => [];
}

class CreateShortUrlEvent extends ShortUrlEvent {
  final String url;

  const CreateShortUrlEvent({
    required this.url,
  });

  @override
  List<Object> get props => [url];
}
