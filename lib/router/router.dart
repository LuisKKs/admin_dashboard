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
  static String Menu_CorredoresRoute = '/dasboard/Menu De Corredores';
  static String Tipos_CarrerasRoute = '/dasboard/Tipo De Carreras';
  static String Menu_EventosRoute = '/dasboard/Menu De Eventos';
  static String Menu_CarrerasRoute = '/dasboard/Menu De Carreras';
  static String categoriasRoute = '/dasboard/Tipo De Carreras/categorias_carrera/:id';

  static String Admin_UsuariosRoute = '/dasboard/Administracion De Usuarios';
  static String UsuarioRoute = '/dasboard/Administracion De Usuarios/:uid';

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
    router.define(Menu_CorredoresRoute, handler: DashboardHandlers.icons);
    router.define(Tipos_CarrerasRoute, handler: DashboardHandlers.Tipos_Carreras);
    router.define(categoriasRoute, handler: DashboardHandlers.categoriasRoute);
    router.define(Menu_EventosRoute, handler: DashboardHandlers.Menu_Eventos);
    router.define(Menu_CarrerasRoute, handler: DashboardHandlers.Menu_Carreras);
    router.define(Admin_UsuariosRoute, handler: DashboardHandlers.Admin_Usuarios);
    router.define(UsuarioRoute, handler: DashboardHandlers.usuario);

    //404
    router.notFoundHandler = NoPageFoundHandlers.noPageFound;
  }
}
