import 'package:admin_dashboard/providers/sidemenu_provider.dart';
import 'package:admin_dashboard/ui/shared/widgets/CustomMenuItem.dart';
import 'package:admin_dashboard/ui/shared/widgets/logo.dart';
import 'package:admin_dashboard/ui/shared/widgets/text_separator.dart';
import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 295,
      height: double.infinity,
      decoration: buildBoxDecoration(),
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          Logo(),
          SizedBox(height: 50),
          TextSeparator(text: 'main'),
          CustomMenuItem(
              text: 'Bienvenida',
              icon: Icons.compass_calibration_outlined,
              isActive: false,
              onPressed: () => SidemenuProvider.closeMenu()),
          SizedBox(height: 10),
          CustomMenuItem(
              text: 'Menu De Eventos',
              icon: Icons.compass_calibration_outlined,
              isActive: false,
              onPressed: () {}),
          SizedBox(height: 10),
          CustomMenuItem(
              text: 'Menu De Carreras',
              icon: Icons.compass_calibration_outlined,
              isActive: false,
              onPressed: () {}),
          SizedBox(height: 10),
          CustomMenuItem(
              text: 'Tipos De Carreras',
              icon: Icons.compass_calibration_outlined,
              isActive: false,
              onPressed: () {}),
          SizedBox(height: 10),
          CustomMenuItem(
              text: 'Menu De Corredores',
              icon: Icons.compass_calibration_outlined,
              isActive: false,
              onPressed: () {}),
          SizedBox(height: 10),
          CustomMenuItem(
              text: 'Administracion De Usuarios',
              icon: Icons.compass_calibration_outlined,
              isActive: false,
              onPressed: () {}),
          SizedBox(height: 30),
          TextSeparator(text: 'pruebas'),
          CustomMenuItem(
              text: 'Black',
              icon: Icons.post_add_outlined,
              isActive: false,
              onPressed: () {}),
        ],
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => BoxDecoration(
      gradient: LinearGradient(colors: [
        Color(0xff092044),
        Color(0xff092042),
      ]),
      boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 10)]);
}
