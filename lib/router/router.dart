import 'package:admin_dashboard/router/admin_handlers.dart';
import 'package:admin_dashboard/router/dashboard_handlres.dart';
import 'package:admin_dashboard/router/no_page_found_handlers.dart';
import 'package:fluro/fluro.dart';

class Flurorouter {
  static final FluroRouter router = new FluroRouter();

  static String rootRoute = '/';

  //Auth Router
  static String loginRoute = '/auth/login';
  static String registerRoute = '/auth/register';

  //Dashboard
  static String dashboardRoute = '/dasboard';
  static String iconsRoute = '/dasboard/icons';
  static String blankRoute = '/dasboard/blank';
  static String Menu_EventosRoute = '/dasboard/Menu_Eventos';
  static String Menu_CarrerasRoute = '/dasboard/Menu_Carreras';

  static void configureRoutes() {
    //Auth Routes
    router.define(rootRoute,
        handler: AdminHandlers.login, transitionType: TransitionType.none);
    router.define(loginRoute,
        handler: AdminHandlers.login, transitionType: TransitionType.none);
    router.define(registerRoute,
        handler: AdminHandlers.register, transitionType: TransitionType.none);

    //dashboard
    router.define(dashboardRoute, handler: DashboardHandlers.dashboard);
    router.define(iconsRoute, handler: DashboardHandlers.icons);
    router.define(blankRoute, handler: DashboardHandlers.blank);
    router.define(Menu_EventosRoute, handler: DashboardHandlers.Menu_Eventos);
    router.define(Menu_CarrerasRoute, handler: DashboardHandlers.Menu_Carreras);

    //404
    router.notFoundHandler = NoPageFoundHandlers.noPageFound;
  }
}
