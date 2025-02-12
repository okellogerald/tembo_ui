import 'package:flutter/material.dart';
import 'package:tembo_core/tembo_core.dart';

Widget compactListViewDivider(BuildContext _, int __) =>
    const TemboDivider.compact();

Widget listViewDivider(BuildContext _, int __) => const SizedBox(height: 10);

class TemboDivider extends StatelessWidget {
  final bool compact;
  final Color? color;

  const TemboDivider({this.color, super.key}) : compact = false;

  const TemboDivider.compact({this.color, super.key}) : compact = true;

  @override
  Widget build(BuildContext context) {
    final scheme = getColorScheme(context);
    return compact
        ? Divider(
            indent: 0,
            height: 0,
            color: color ?? scheme.onSurface,
          )
        : Divider(color: color ?? scheme.onSurface);
  }
}
