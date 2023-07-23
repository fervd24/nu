
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nu_test1/features/shorten_link/presentation/bloc/short_url_bloc.dart';

class ShortUrlInput extends StatelessWidget {
  const ShortUrlInput({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    late String normalUrl;
    final screenSize = MediaQuery.of(context).size;

    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: screenSize.width * .55,
            child: TextField(
              onChanged:(value) {
                normalUrl = value;
              },
              decoration: const InputDecoration(
              ),
            ),
          ),
          const SizedBox(width: 10,),
          IconButton(
            onPressed: () async {
              BlocProvider.of<ShortUrlBloc>(context).add(CreateShortUrlEvent(url: normalUrl)); 
    
            },
            iconSize: 30,
            icon: const Icon(Icons.arrow_forward_outlined)
          )
        ],
      ),
    );
  }
}