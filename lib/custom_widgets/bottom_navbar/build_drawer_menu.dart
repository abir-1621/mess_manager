import 'package:flutter/material.dart';

class BuildDrawerMenu extends StatefulWidget {
  Widget? leading;
  final String title;
  Widget? trailing;

  BuildDrawerMenu({Key? key, this.leading, required this.title, this.trailing})
      : super(key: key);

  @override
  State<BuildDrawerMenu> createState() => _BuildDrawerMenuState();
}

class _BuildDrawerMenuState extends State<BuildDrawerMenu> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: widget.leading,
      trailing: widget.trailing,
      title: Text(
        widget.title,
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }
}
