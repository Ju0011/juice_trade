import 'package:flutter/material.dart';
import 'package:juice_trade/components/constants.dart';

import '../../../theme.dart';

class NewsItem extends StatelessWidget {
  final Map<String, dynamic> item;

  const NewsItem({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ListTile(
      horizontalTitleGap: 10,
      title: Text(item['sBody'] ?? 'No name'),
    );
  }
}
