import 'package:admin_dashboard/ui/shared/sidebar.dart';
import 'package:flutter/material.dart';

class DashboardLayout extends StatelessWidget {
  final Widget child;

  const DashboardLayout({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffEDF1F2),
        body: Row(
          children: [
            //todo esto depende si es mas de 700 px
            Sidebar(),

            //contenedor de nuestro view
            Expanded(child: child),
          ],
        ));
  }
}
