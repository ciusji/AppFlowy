import 'package:flutter/material.dart';

typedef OnHeaderAddButtonClick = void Function();
typedef OnHeaderMoreButtonClick = void Function();

class AppFlowyColumnHeader extends StatefulWidget {
  final double height;
  final Widget? icon;
  final Widget? title;
  final Widget? addIcon;
  final Widget? moreIcon;
  final EdgeInsets margin;
  final OnHeaderAddButtonClick? onAddButtonClick;
  final OnHeaderMoreButtonClick? onMoreButtonClick;

  const AppFlowyColumnHeader({
    required this.height,
    this.icon,
    this.title,
    this.addIcon,
    this.moreIcon,
    this.margin = EdgeInsets.zero,
    this.onAddButtonClick,
    this.onMoreButtonClick,
    Key? key,
  }) : super(key: key);

  @override
  State<AppFlowyColumnHeader> createState() => _AppFlowyColumnHeaderState();
}

class _AppFlowyColumnHeaderState extends State<AppFlowyColumnHeader> {
  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];

    if (widget.icon != null) {
      children.add(widget.icon!);
      children.add(_hSpace());
    }

    if (widget.title != null) {
      children.add(widget.title!);
      children.add(_hSpace());
    }

    if (widget.moreIcon != null) {
      children.add(const Spacer());
      children.add(
        IconButton(onPressed: widget.onMoreButtonClick, icon: widget.moreIcon!),
      );
    }

    if (widget.addIcon != null) {
      children.add(
        IconButton(onPressed: widget.onAddButtonClick, icon: widget.addIcon!),
      );
    }

    return SizedBox(
      height: widget.height,
      child: Padding(
        padding: widget.margin,
        child: Row(
          children: children,
        ),
      ),
    );
  }

  Widget _hSpace() {
    return const SizedBox(width: 6);
  }
}
