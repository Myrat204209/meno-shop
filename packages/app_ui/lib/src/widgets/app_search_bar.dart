// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class AppSearchBar extends StatefulWidget {
  const AppSearchBar({
    super.key,
    required this.hintText,
  });
  final String hintText;
  @override
  State<AppSearchBar> createState() => _AppSearchBarState();
}

class _AppSearchBarState extends State<AppSearchBar> {
  late final TextEditingController _controller;
  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return UITextField(
      controller: _controller,
      prefix: Icon(
        Icons.search,
        color: AppColors.neutral.shade700,
      ),
      hintText: widget.hintText,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
