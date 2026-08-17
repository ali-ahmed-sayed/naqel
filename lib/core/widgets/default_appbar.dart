import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:naqel/core/widgets/logo.dart';

AppBar defaultAppBar(
  BuildContext context, {
  bool? withSpace,
  List<Widget>? actions,
  Color? backgroundColor,
}) {
  return AppBar(
    backgroundColor: backgroundColor ?? Colors.transparent,
    surfaceTintColor: Colors.transparent,
    elevation: 0,
    leading: context.canPop()
        ? BackButton(color: Colors.blue, onPressed: () => context.pop())
        : withSpace ?? false
        ? Container()
        : null,
    title: Padding(padding: const EdgeInsets.all(16.0), child: Logo()),
    actions: actions,
  );
}
