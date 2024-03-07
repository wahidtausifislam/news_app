import 'package:flutter/material.dart';
import 'package:news_app/apiservice.dart';

import 'newsModel.dart';
import 'newsitem_list.dart';

class allnews extends StatefulWidget {
  const allnews({super.key});

  @override
  State<allnews> createState() => _breakingnewsState();
}

class _breakingnewsState extends State<allnews> {
  Apiservice apiservice = Apiservice();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: apiservice.getAllnews(),
        builder:
            (BuildContext context, AsyncSnapshot<List<newsModel>> snapshot) {
          if (snapshot.hasData) {
            List<newsModel> articlelist = snapshot.data ?? [];
            return ListView.builder(
                itemCount: articlelist.length,
                itemBuilder: (context, index) {
                  return newsitemlist(newsmodel: articlelist[index]);
                });
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
