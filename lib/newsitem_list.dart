import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/newsModel.dart';

import 'news_details_screen.dart';

class newsitemlist extends StatelessWidget {
  final newsModel newsmodel;
  newsitemlist({super.key, required this.newsmodel});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
        child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => NewsDetails(
                          newsmodel: newsmodel,
                        )));
          },
          child: SizedBox(
            width: double.infinity,
            child: Card(
              color: Colors.grey.shade300,
              elevation: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(newsmodel.title.toString()),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: CachedNetworkImage(
                      imageUrl: newsmodel.urlToImage.toString(),
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                  Wrap(
                    alignment: WrapAlignment.start,
                    crossAxisAlignment: WrapCrossAlignment.start,
                    children: [
                      Card(
                        elevation: 0,
                        color: Colors.green.shade800,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(newsmodel.source!.name.toString()),
                        ),
                      ),
                      Card(
                        elevation: 0,
                        color: Colors.grey,
                        child: Text(newsmodel.publishedAt.toString()),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
