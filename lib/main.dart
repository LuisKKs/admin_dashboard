import 'package:admin_dashboard/api/eventos_api.dart';
import 'package:admin_dashboard/providers/auth_provider.dart';
import 'package:admin_dashboard/providers/carreras_provider.dart';
import 'package:admin_dashboard/providers/corredores_provider.dart';
import 'package:admin_dashboard/providers/eventos_provider.dart';
import 'package:admin_dashboard/providers/sidemenu_provider.dart';
import 'package:admin_dashboard/providers/tipo_carrera_provider.dart';
import 'package:admin_dashboard/providers/usuarios_provider.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/services/local_storage.dart';
import 'package:admin_dashboard/services/navigation_service.dart';
import 'package:admin_dashboard/services/notifications_service.dart';
import 'package:admin_dashboard/ui/layouts/auth/auth_layout.dart';
import 'package:admin_dashboard/ui/layouts/dasboard/dashboard_layouth.dart';
import 'package:admin_dashboard/ui/layouts/splash/splash_layout.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  await LocalStorage.configurePrefs();
  EventosApi.configureDio();
  Flurorouter.configureRoutes();
  runApp(AppState());
}

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(lazy: false, create: (_) => AuthProvider()),
        ChangeNotifierProvider(lazy: false, create: (_) => SidemenuProvider()),
        ChangeNotifierProvider(create: (_) => EventosProvider()),
        ChangeNotifierProvider(create: (_) => CatCarreraProvider()),
        ChangeNotifierProvider(create: (_) => CorredoresProvider()),
        ChangeNotifierProvider(create: (_) => CarrerasProvider()),
        ChangeNotifierProvider(create: (_) => UsuariosProvider())
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      scrollBehavior: _CustomScrollBehavior(),
      title: 'Admin Dashboard',
      initialRoute: '/',
      onGenerateRoute: Flurorouter.router.generator,
      navigatorKey: NavigationService.navigatorKey,
      scaffoldMessengerKey: NotificationsService.messengerKey,
      builder: (_, child) {
        final authProvider = Provider.of<AuthProvider>(context);

        if (authProvider.authStatus == AuthStatus.checking)
          return SplashLayout();

        if (authProvider.authStatus == AuthStatus.authenticated) {
          return DashboardLayout(child: child!);
        } else {
          return AuthLayout(child: child!);
        }
      },
      theme: ThemeData.light().copyWith(
          scrollbarTheme: ScrollbarThemeData().copyWith(
              thumbColor: MaterialStateProperty.all(
                  Color.fromARGB(255, 63, 61, 61).withOpacity(0.5)))),
    );

    //el nestor es la puta del zurdo
  }
}

class _CustomScrollBehavior extends MaterialScrollBehavior {
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.mouse,
        PointerDeviceKind.touch,
        PointerDeviceKind.trackpad
      };
}
