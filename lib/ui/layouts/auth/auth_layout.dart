import 'package:admin_dashboard/ui/layouts/auth/widgets/backgroundLogin.dart';
import 'package:admin_dashboard/ui/layouts/auth/widgets/custom_title.dart';
import 'package:admin_dashboard/ui/layouts/auth/widgets/links_bar.dart';
import 'package:flutter/material.dart';

class AuthLayout extends StatelessWidget {
  final Widget child;

  const AuthLayout({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        body: Scrollbar(
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          (size.width > 1000)
              ? _DesktopBody(child: child)
              : _MobileBody(child: child),

          //LinksBar
          LinksBar()
        ],
      ),
    ));
  }
}

class _MobileBody extends StatelessWidget {
  final Widget child;

  const _MobileBody({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 241, 238, 237),
      //color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          CustomTitleMobile(),
          Container(
            width: double.infinity,
            height: 400,
            child: BackgroundMobile(),
          ),
          Container(
            width: double.infinity,
            height: 420,
            child: child,
          )
        ],
      ),
    );
  }
}

class _DesktopBody extends StatelessWidget {
  final Widget child;

  const _DesktopBody({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height * 0.96,
      color: Colors.black,
      child: Row(children: [
        //twiter backround
        BackgroundDesktop(),
        //viewContainer
        Container(
          width: 600,
          height: double.infinity,
          color: Color.fromARGB(255, 241, 238, 237),
          child: Column(children: [
            CustomTitle(),
            SizedBox(height: 50),
            Expanded(child: child),
          ]),
        )
      ]),
    );
  }
}
