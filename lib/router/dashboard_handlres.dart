import 'package:admin_dashboard/providers/auth_provider.dart';
import 'package:admin_dashboard/providers/sidemenu_provider.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/ui/views/Menu_EventosView.dart';
import 'package:admin_dashboard/ui/views/blank_view.dart';
import 'package:admin_dashboard/ui/views/dashboard_view.dart';
import 'package:admin_dashboard/ui/views/icons_view.dart';
import 'package:admin_dashboard/ui/views/login_view.dart';
import 'package:admin_dashboard/ui/views/menu_carrerasView.dart';
import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';

class DashboardHandlers {
  static Handler dashboard = Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);
    Provider.of<SidemenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.dashboardRoute);

    if (authProvider.authStatus == AuthStatus.notAuthenticated)
      return LoginView();
    else
      return DashboardView();
  });

  static Handler icons = Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);
    Provider.of<SidemenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.iconsRoute);
    if (authProvider.authStatus == AuthStatus.notAuthenticated)
      return LoginView();
    else
      return IconsView();
  });

  static Handler blank = Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);
    Provider.of<SidemenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.blankRoute);
    if (authProvider.authStatus == AuthStatus.notAuthenticated)
      return LoginView();
    else
      return BlankView();
  });

  static Handler Menu_Eventos = Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);
    Provider.of<SidemenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.Menu_EventosRoute);
    if (authProvider.authStatus == AuthStatus.notAuthenticated)
      return LoginView();
    else
      return Menu_EventosView();
  });

  static Handler Menu_Carreras = Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);
    Provider.of<SidemenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.Menu_CarrerasRoute);
    if (authProvider.authStatus == AuthStatus.notAuthenticated)
      return LoginView();
    else
      return Menu_CarrerasView();
  });
}
