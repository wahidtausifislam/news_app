import 'package:flutter/material.dart';
import 'package:news_app/all_news.dart';

import 'breaking_news.dart';

class presentation extends StatefulWidget {
  const presentation({super.key});

  @override
  State<presentation> createState() => _presentationState();
}

class _presentationState extends State<presentation> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            title: Text("News App"),
            backgroundColor: Colors.green,
            centerTitle: true,
            bottom: TabBar(
              tabs: [
                Tab(
                  text: "Breaking News",
                ),
                Tab(
                  text: "All News",
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              breakingnews(),
              allnews(),
            ],
          )),
    );
  }
}
