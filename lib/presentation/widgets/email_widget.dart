import 'package:flutter/material.dart';
import 'package:messager_app/presentation/widgets/email_content.dart';
import 'package:messager_app/presentation/widgets/email_headline.dart';

import '../../models/email.dart';

enum EmailType {
  preview,
  threaded,
  primaryThreaded,
}

class EmailWidget extends StatefulWidget {
  const EmailWidget(
      {super.key,
      required this.email,
      this.isSelected = false,
      this.isPreview = true,
      this.showHeadline = false,
      this.isThreaded = false,
      this.onSelected});

  final bool isSelected;
  final bool isPreview;
  final bool showHeadline;
  final bool isThreaded;
  final void Function()? onSelected;
  final Email email;

  @override
  State<EmailWidget> createState() => _EmailWidgetState();
}

class _EmailWidgetState extends State<EmailWidget> {
  late final ColorScheme _colorScheme = Theme.of(context).colorScheme;
  late Color unselectedColor = Color.alphaBlend(
    _colorScheme.primary.withOpacity(0.08),
    _colorScheme.surface,
  );

  Color get _surfaceColor => switch (widget) {
        EmailWidget(isPreview: false) => _colorScheme.surface,
        EmailWidget(isSelected: true) => _colorScheme.primaryContainer,
        _ => unselectedColor,
      };

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onSelected,
      child: Card(
        elevation: 0,
        color: _surfaceColor,
        clipBehavior: Clip.hardEdge,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (widget.showHeadline) ...[
              EmailHeadline(email: widget.email, isSelected: widget.isSelected),
            ],
            EmailContent(
                email: widget.email,
                isPreview: widget.isPreview,
                isThreaded: widget.isThreaded,
                isSelected: widget.isSelected),
          ],
        ),
      ),
    );
  }
}
