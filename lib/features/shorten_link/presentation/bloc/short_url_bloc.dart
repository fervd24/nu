
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nu_test1/core/error/failures.dart';
import 'package:nu_test1/features/shorten_link/domain/entities/short_url.dart';
import 'package:nu_test1/features/shorten_link/domain/usecases/create_short_url.dart';

part 'short_url_event.dart';
part 'short_url_state.dart';

class ShortUrlBloc extends Bloc<ShortUrlEvent, ShortUrlState> {

  final CreateShortUrl createShortUrl;
  //TODO: pass it in params
  Set<ShortUrl> updatedShortUrls = {};
  ShortUrlBloc({
    required this.createShortUrl
  }) : super(ShortUrlInit()) {
    on<CreateShortUrlEvent>((event, emit) async => await _onGetShortUrl(event, emit));
  }

  Future<void> _onGetShortUrl(
    CreateShortUrlEvent event,
    Emitter<ShortUrlState> emit
  ) async {
    emit(ShortUrlLoading());
    final failureOrShortUrl = await createShortUrl(Params(url: event.url));
    emit(failureOrShortUrl!.fold(
      (failure) => ErrorState(message: _mapFailureToMessage(failure)), 
      (shortUrl) {
        updatedShortUrls.add(shortUrl);
        return ShortUrlListed(
            shortUrl: shortUrl, 
            shortUrls: updatedShortUrls
        );
      })
    );
  }

   String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return 'Server Failure';
      case CacheFailure:
        return 'Cache failure';
      default:
        return 'Unexpected error';
    }
  }
}
