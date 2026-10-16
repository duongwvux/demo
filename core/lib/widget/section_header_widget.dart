import 'package:flutter/material.dart';

class SectionHeaderWidget extends StatelessWidget {
  const SectionHeaderWidget({
    super.key,
    required this.title,
    this.trailing
  });

  final String title;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: [
        Expanded(
          child: Semantics(
            header: true,
            child: Text(
              title,
              style: theme.textTheme.headlineSmall,
            ),
          ),
        ),
        if (trailing != null) ...[
          const SizedBox(width: 12,),
          trailing!,
        ]
      ],
    );
  }
}
