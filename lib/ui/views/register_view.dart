import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/ui/buttons/custom_outlined_button.dart';
import 'package:admin_dashboard/ui/buttons/link_text.dart';
import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 50),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 370),
          child: Form(
              child: Column(
            children: [
              Text(
                'Registrate',
                style: GoogleFonts.montserratAlternates(
                    fontSize: 40,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold),
              ),

              //email
              TextFormField(
                //validator(),
                style: TextStyle(color: Colors.black),
                decoration: CustomInputs.loginInputDecoration(
                    hint: 'Ingrese su nombre',
                    label: 'Nombre',
                    icon: Icons.supervised_user_circle_sharp),
              ),

              SizedBox(
                height: 20,
              ),

              TextFormField(
                //validator(),
                style: TextStyle(color: Colors.black),
                decoration: CustomInputs.loginInputDecoration(
                    hint: 'Ingrese su correo',
                    label: 'Email',
                    icon: Icons.email_outlined),
              ),

              SizedBox(
                height: 20,
              ),

              //contraseña
              TextFormField(
                //validator(),
                obscureText: true,
                style: TextStyle(color: Colors.black),
                decoration: CustomInputs.loginInputDecoration(
                    hint: '**********',
                    label: 'Contraseña',
                    icon: Icons.lock_outline_rounded),
              ),

              SizedBox(height: 20),
              CustomOutlinedButton(
                onPressed: () {},
                text: 'Crear Cuenta ',
              ),

              SizedBox(height: 20),
              LinkText(
                text: 'Ir al login',
                onPressed: () {
                  Navigator.pushNamed(context, Flurorouter.loginRoute);
                },
              ),
            ],
          )),
        ),
      ),
    );
  }
}
