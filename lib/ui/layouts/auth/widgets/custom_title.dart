import 'package:admin_dashboard/ui/layouts/auth/widgets/backgroundLogin.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(children: [
        Image.asset(
          'logoChido2.png',
          width: 50,
          height: 50,
        ),
        SizedBox(height: 20),
        FittedBox(
          fit: BoxFit.contain,
          child: Text(
            'Comienza Tu Carrera',
            style: GoogleFonts.montserratAlternates(
                fontSize: 60, color: Colors.black, fontWeight: FontWeight.bold),
          ),
        )
      ]),
    );
  }
}

class CustomTitleMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(children: [
        /*Image.asset(
          'logoChido2.png',
          width: 50,
          height: 50,
        ),*/
        //SizedBox(height: 20),
        FittedBox(
          fit: BoxFit.contain,
          child: Text(
            'Comienza Tu Carrera',
            style: GoogleFonts.montserratAlternates(
                fontSize: 60, color: Colors.black, fontWeight: FontWeight.bold),
          ),
        )
      ]),
    );
  }
}
