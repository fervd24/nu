// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/widgets.dart';

import 'package:nu_test1/features/shorten_link/domain/entities/short_url.dart';

class ShortUrlsWidget extends StatelessWidget {

  final Set<ShortUrl> shortUrls;
  
  const ShortUrlsWidget({
    Key? key,
    required this.shortUrls,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: double.infinity,
      child: ListView.builder(
          itemCount: shortUrls.length,
          itemBuilder:(context, index) {
            List<ShortUrl> shortUrlsList = shortUrls.toList();
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 19),
              child: Text(
                '${index + 1}. ${shortUrlsList[index].links?.short}',
                overflow: TextOverflow.clip,
                maxLines: 2,
                style: const TextStyle(fontSize: 17),
              ),
            );
          },
      ),
    );
  }
}
