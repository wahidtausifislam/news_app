import 'package:flutter/material.dart';
import 'package:news_app/apiservice.dart';

import 'newsModel.dart';
import 'newsitem_list.dart';

class breakingnews extends StatefulWidget {
  const breakingnews({super.key});

  @override
  State<breakingnews> createState() => _breakingnewsState();
}

class _breakingnewsState extends State<breakingnews> {
  Apiservice apiservice = Apiservice();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: apiservice.getbreakingnews(),
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
