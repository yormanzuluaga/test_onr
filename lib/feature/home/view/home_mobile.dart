import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:onr_test/app/routes/routes_names.dart';
import 'package:onr_test/feature/home/widgets/app_drawer.dart';
import 'package:onr_ui/onr_ui.dart';

class HomeMobile extends StatefulWidget {
  const HomeMobile({
    required this.child,
    super.key,
  });
  final Widget child;
  @override
  State<HomeMobile> createState() => _HomeMobileState();
}

class _HomeMobileState extends State<HomeMobile> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: AppDrawer(),
      backgroundColor: AppColors.white,
      body: SafeArea(child: widget.child),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.black,
        onTap: (value) {
          value != 0 ? context.go(RoutesNames.user) : context.go(RoutesNames.home);
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Productos'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Usuarios')
        ],
      ),
    );
  }
}
