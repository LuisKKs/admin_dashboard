import 'package:admin_dashboard/providers/login_form_provider.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/ui/buttons/custom_outlined_button.dart';
import 'package:admin_dashboard/ui/buttons/link_text.dart';
import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => LoginFormProvider(),
        child: Builder(builder: (contex) {
          final loginFormProvider =
              Provider.of<LoginFormProvider>(contex, listen: false);

          return Container(
            margin: EdgeInsets.only(top: 100),
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 370),
                child: Form(
                    key: loginFormProvider.formKey,
                    child: Column(
                      children: [
                        Text(
                          'Inicia Sesion ',
                          style: GoogleFonts.montserratAlternates(
                              fontSize: 40,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold),
                        ),
                        //email
                        TextFormField(
                          validator: (value) {
                            if (!EmailValidator.validate(value ?? ''))
                              return 'Email no valido';
                            return null;
                          },
                          onChanged: (value) => loginFormProvider.email = value,
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
                          onChanged: (value) =>
                              loginFormProvider.password = value,
                          validator: (value) {
                            if (value == null || value.isEmpty)
                              return 'Ingrese su contraseña';
                            if (value.length < 8)
                              return 'La contraseña debe ser de 8 digitos o mas';

                            return null; //valido
                          },
                          obscureText: true,
                          style: TextStyle(color: Colors.black),
                          decoration: CustomInputs.loginInputDecoration(
                              hint: '**********',
                              label: 'Contraseña',
                              icon: Icons.lock_outline_rounded),
                        ),

                        SizedBox(height: 20),
                        CustomOutlinedButton(
                          onPressed: () {
                            loginFormProvider.validateForm();
                          },
                          text: 'Ingresar',
                        ),

                        SizedBox(height: 20),
                        LinkText(
                          text: 'Crear Nuevo Usuario',
                          onPressed: () {
                            Navigator.pushNamed(
                                context, Flurorouter.registerRoute);
                          },
                        ),
                      ],
                    )),
              ),
            ),
          );
        }));
  }
}
