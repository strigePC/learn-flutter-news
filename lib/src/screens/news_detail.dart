import 'package:flutter/material.dart';

class NewsDetail extends StatelessWidget {
  NewsDetail({this.itemId});

  final int itemId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News Detail'),
      ),
      body: Text('Details Screen: $itemId'),
    );
  }

}