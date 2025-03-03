import 'package:onr_ui/onr_ui.dart';
import 'package:flutter/material.dart';

class HomeDesktop extends StatefulWidget {
  const HomeDesktop({
    required this.child,
    super.key,
  });
  final Widget child;

  @override
  State<HomeDesktop> createState() => _HomeDesktopState();
}

class _HomeDesktopState extends State<HomeDesktop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey,
      body: Row(
        children: [
          Expanded(
            child: widget.child,
          ),
        ],
      ),
    );
  }
}
