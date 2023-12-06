import 'package:flutter/cupertino.dart';
import 'package:tembo_ui/source.dart';

class TemboChips<T extends Comparable<T>> extends StatefulWidget {
  final List<T> options;
  final String Function(T option) name;
  final void Function(T option) onTap;
  final bool Function(T option) selected;

  const TemboChips({
    super.key,
    required this.options,
    required this.name,
    required this.onTap,
    required this.selected,
  });

  @override
  State<TemboChips<T>> createState() => _TemboChipsState<T>();
}

class _TemboChipsState<T extends Comparable<T>> extends State<TemboChips<T>> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: kHorPadding.left,
      runSpacing: kHorPadding.left,
      children: List.generate(widget.options.length, buildButton),
    );
  }

  Widget buildButton(int index) {
    final option = widget.options[index];
    return TemboOptionButton(
      onTap: () => widget.onTap(option),
      name: widget.name(option),
      selected: widget.selected(option),
    );
  }
}

class TemboOptionButton extends StatelessWidget {
  final void Function() onTap;
  final String name;
  final bool selected;

  const TemboOptionButton({
    super.key,
    required this.onTap,
    required this.name,
    required this.selected,
  });

  TemboButtonStyle unselectedStyle(BuildContext context) {
    return TemboButtonStyle(
      backgroundColor: context.colorScheme.surfaceContainer,
      foregroundColor: context.colorScheme.onSurfaceContainer,
      borderRadius: kBorderRadius3,
      padding: horizontal() + vertical(),
    );
  }

  TemboButtonStyle selectedStyle(BuildContext context) {
    return unselectedStyle(context).copyWith(
      backgroundColor: context.colorScheme.primary,
      foregroundColor: context.colorScheme.onPrimary,
      borderWidth: 0,
      borderColor: Colors.transparent,
    );
  }

  @override
  Widget build(BuildContext context) {
    final style = selected ? selectedStyle(context) : unselectedStyle(context);

    return TemboTextButton(
      onPressed: onTap,
      style: style,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          TemboText(
            name,
            style: style.getTextStyle,
            maxLines: 2,
          ),
          if (selected)
            Padding(
              padding: left(8.0),
              child: Icon(
                CupertinoIcons.check_mark,
                color: style.foregroundColor,
              ),
            )
        ],
      ),
    );
  }
}
