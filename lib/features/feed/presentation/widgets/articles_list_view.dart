import 'package:flutter/material.dart';

class ArticlesListView extends StatelessWidget {
  const ArticlesListView({super.key, this.text});
  final String? text;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(text ?? "coming soon"),
    );
  }
}
