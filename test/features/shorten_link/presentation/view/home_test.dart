
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';
import 'package:nu_test1/features/shorten_link/domain/usecases/create_short_url.dart';
import 'package:nu_test1/features/shorten_link/presentation/bloc/short_url_bloc.dart';
import 'package:nu_test1/features/shorten_link/presentation/view/home.dart';

class MockCreateShortUrl extends Mock implements CreateShortUrl {}

void main() {

  late ShortUrlBloc shortUrlBloc;
  late CreateShortUrl createShortUrl;

  group('HomeScreen initial renders', () {
      setUp(() {
        createShortUrl = MockCreateShortUrl();
        shortUrlBloc = ShortUrlBloc(createShortUrl: createShortUrl);
      });

      GetIt.I.registerLazySingleton<ShortUrlBloc>(() => shortUrlBloc);
      
      testWidgets('TextField widget', (widgetTester) async {
        await widgetTester.pumpWidget(
          const MaterialApp(home: HomeScreen(),)
        );
        expect(find.byType(TextField), findsOneWidget);
      });

      testWidgets('Icon Button widget', (widgetTester) async {
        await widgetTester.pumpWidget(
          const MaterialApp(home: HomeScreen(),)
        );
        expect(find.byType(IconButton), findsOneWidget);
      });

      testWidgets('Text urls list', (widgetTester) async {
        await widgetTester.pumpWidget(
          const MaterialApp(home: HomeScreen(),)
        );

        expect(find.text('Empty List'), findsOneWidget);
      });
    });
}
