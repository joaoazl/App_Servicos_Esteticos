import 'package:flutter/material.dart';

class ListItem {
  final String title;
  final void Function(BuildContext) event;

  const ListItem({
    required this.title,
    required this.event
  });
}