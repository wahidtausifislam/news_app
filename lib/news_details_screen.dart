import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/newsModel.dart';

class NewsDetails extends StatefulWidget {
  final newsModel newsmodel;
  const NewsDetails({super.key, required this.newsmodel});

  @override
  State<NewsDetails> createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.newsmodel.title.toString()),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(widget.newsmodel.title.toString()),
            CachedNetworkImage(
              imageUrl: widget.newsmodel.urlToImage.toString(),
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    widget.newsmodel.title.toString(),
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(widget.newsmodel.description.toString()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
