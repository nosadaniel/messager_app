import 'package:flutter/material.dart';
import 'package:messager_app/models/email.dart';

class EmailHeadline extends StatefulWidget {
  const EmailHeadline(
      {super.key, required this.email, required this.isSelected});

  final Email email;
  final bool isSelected;

  @override
  State<EmailHeadline> createState() => _EmailHeadlineState();
}

class _EmailHeadlineState extends State<EmailHeadline> {
  late final TextTheme _textTheme = Theme.of(context).textTheme;
  late final ColorScheme _colorScheme = Theme.of(context).colorScheme;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        height: 84,
        color: Color.alphaBlend(
            _colorScheme.primary.withOpacity(0.05), _colorScheme.surface),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.email.subject,
                    maxLines: 1,
                    overflow: TextOverflow.fade,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w400),
                  ),
                  Text(
                    '${widget.email.replies.toString()} Messages',
                    maxLines: 1,
                    overflow: TextOverflow.fade,
                    style: _textTheme.labelMedium
                        ?.copyWith(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            //Display a "condensed" version if the widget in the row are
            //expected to overflow
            if (constraints.maxWidth - 200 > 0) ...[
              CustomFloatingActionButton(
                color: _colorScheme.surface,
                iconData: Icons.delete_outline,
                onPressed: () {},
              ),
              const Padding(padding: EdgeInsets.only(right: 8.0)),
              CustomFloatingActionButton(
                color: _colorScheme.surface,
                iconData: Icons.more_vert,
                onPressed: () {},
              ),
            ]
          ],
        ),
      );
    });
  }
}

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton(
      {super.key, required this.color, required this.iconData, this.onPressed});

  final Color color;
  final Function()? onPressed;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: 40,
      child: FloatingActionButton(
        onPressed: onPressed,
        elevation: 0,
        backgroundColor: color,
        child: Icon(iconData),
      ),
    );
  }
}
