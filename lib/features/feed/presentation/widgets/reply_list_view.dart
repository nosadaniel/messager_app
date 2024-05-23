import 'package:flutter/material.dart';
import 'package:messager_app/features/feed/data/data.dart' as data;
import 'package:messager_app/features/feed/presentation/widgets/email_widget.dart';

class ReplyListView extends StatelessWidget {
  const ReplyListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: ListView(
        children: [
          const SizedBox(height: 8),
          ...List.generate(
            data.replies.length,
            (index) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: EmailWidget(
                email: data.replies[index],
                isPreview: false,
                isThreaded: true,
                showHeadline: index == 0,
              ),
            ),
          )
        ],
      ),
    );
  }
}
