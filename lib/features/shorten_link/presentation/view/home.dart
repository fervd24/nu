import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nu_test1/features/shorten_link/presentation/bloc/short_url_bloc.dart';
import 'package:nu_test1/features/shorten_link/presentation/widgets/loading_widget.dart';
import 'package:nu_test1/features/shorten_link/presentation/widgets/message_display.dart';
import 'package:nu_test1/features/shorten_link/presentation/widgets/short_url_input.dart';
import 'package:nu_test1/features/shorten_link/presentation/widgets/short_urls_widget.dart';
import 'package:nu_test1/injection_container.dart';

class HomeScreen extends StatelessWidget {
   
  const HomeScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: buildBody(context),
      )
    );
  }

  BlocProvider<ShortUrlBloc> buildBody(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<ShortUrlBloc>(),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(60),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const ShortUrlInput(),
              const SizedBox(height: 70,),
              const Text('URLs List', style: TextStyle(fontSize: 27),),
              const SizedBox(height: 50,),
              BlocBuilder<ShortUrlBloc, ShortUrlState>(builder: (context, state) {
                if(state is ShortUrlInit){
                  return const MessageDisplay(message: 'Empty List');
                }
                else if(state is ShortUrlLoading) {
                  return const LoadingWidget();
                }
                else if(state is ShortUrlListed) {
                  return ShortUrlsWidget(shortUrls: state.shortUrls,);
                } else if(state is ErrorState) {
                  return MessageDisplay(message: state.message);
                }
                return Container();
              }),
            ],
          ), 
        ),
      ),
    );
  }
}

