import 'package:admin_dashboard/providers/auth_provider.dart';
import 'package:admin_dashboard/providers/sidemenu_provider.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/services/navigation_service.dart';
import 'package:admin_dashboard/ui/shared/widgets/CustomMenuItem.dart';
import 'package:admin_dashboard/ui/shared/widgets/logo.dart';
import 'package:admin_dashboard/ui/shared/widgets/text_separator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Sidebar extends StatelessWidget {
  void navigateTo(String routeName) {
    NavigationService.navigateTo(routeName);
    SidemenuProvider.closeMenu();
  }

  @override
  Widget build(BuildContext context) {
    final sideMenuProvider = Provider.of<SidemenuProvider>(context);

    return Container(
      width: 295,
      height: double.infinity,
      decoration: buildBoxDecoration(),
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          Logo(),
          SizedBox(height: 50),
          TextSeparator(text: 'Menu'),
          CustomMenuItem(
            text: 'Inicio',
            icon: Icons.home_outlined,
            onPressed: () => navigateTo(Flurorouter.dashboardRoute),
            isActive:
                sideMenuProvider.currentPage == Flurorouter.dashboardRoute,
          ),
          SizedBox(height: 10),
          CustomMenuItem(
            text: 'Menu De Eventos',
            icon: Icons.event_available_outlined,
            onPressed: () => navigateTo(Flurorouter.Menu_EventosRoute),
            isActive:
                sideMenuProvider.currentPage == Flurorouter.Menu_EventosRoute,
          ),
          SizedBox(height: 10),
          CustomMenuItem(
            text: 'Menu De Carreras',
            icon: Icons.flag_circle_outlined,
            onPressed: () => navigateTo(Flurorouter.Menu_CarrerasRoute),
            isActive:
                sideMenuProvider.currentPage == Flurorouter.Menu_CarrerasRoute,
          ),
          SizedBox(height: 10),
          CustomMenuItem(
              text: 'Tipo De Carreras',
              icon: Icons.type_specimen_outlined,
              onPressed: () => navigateTo(Flurorouter.Tipos_CarrerasRoute),
              isActive: sideMenuProvider.currentPage ==
                  Flurorouter.Tipos_CarrerasRoute),
          SizedBox(height: 10),
          CustomMenuItem(
              isActive: sideMenuProvider.currentPage ==
                  Flurorouter.Menu_CorredoresRoute,
              text: 'Menu De Corredores',
              icon: Icons.run_circle_outlined,
              onPressed: () => navigateTo(Flurorouter.Menu_CorredoresRoute)),
          SizedBox(height: 10),
          CustomMenuItem(
              text: 'Administracion De Usuarios',
              icon: Icons.supervised_user_circle_outlined,
              onPressed: () => navigateTo(Flurorouter.Admin_UsuariosRoute),
              isActive: sideMenuProvider.currentPage ==
                  Flurorouter.Admin_UsuariosRoute),
          SizedBox(height: 100),
          TextSeparator(text: 'Salir'),
          CustomMenuItem(
              text: 'Cerrar Sesion',
              icon: Icons.exit_to_app_outlined,
              isActive: false,
              onPressed: () {
                Provider.of<AuthProvider>(context, listen: false).logout();
              }),
        ],
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => BoxDecoration(
      image: DecorationImage(image: AssetImage('fondo1.png'), fit: BoxFit.cover)
      /*gradient: LinearGradient(colors: [
        Color(0xff092044),
        Color(0xff092042),
      ])*/
      ,
      boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 10)]);
}
