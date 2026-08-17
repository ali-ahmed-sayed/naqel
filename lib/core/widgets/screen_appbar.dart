import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

AppBar screenAppBar(
  BuildContext context,
  String title, {
  bool? withSpace,
  List<Widget>? actions,
  Color? backgroundColor,
}) {
  return AppBar(
    backgroundColor: backgroundColor ?? Colors.transparent,
    surfaceTintColor: Colors.transparent,
    elevation: 0,
    leading: context.canPop()
        ? BackButton( onPressed: () => context.pop())
        : withSpace ?? false
        ? Container()
        : null,
    actions: actions,
    title: Text(title),
  );
}
