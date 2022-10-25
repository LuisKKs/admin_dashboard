import 'package:admin_dashboard/providers/auth_provider.dart';
import 'package:admin_dashboard/providers/register_form_provider.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/ui/buttons/custom_outlined_button.dart';
import 'package:admin_dashboard/ui/buttons/link_text.dart';
import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RegisterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RegisterFormProvider(),
      child: Builder(builder: (context) {
        final registerFormProvider =
            Provider.of<RegisterFormProvider>(context, listen: false);

        return Container(
          margin: EdgeInsets.only(top: 50),
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 370),
              child: Form(
                  autovalidateMode: AutovalidateMode.always,
                  key: registerFormProvider.formKey,
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
                        onChanged: (value) => registerFormProvider.name = value,
                        validator: (value) {
                          if (value == null || value.isEmpty)
                            return 'El nombre es obligatorio';
                          return null;
                        },
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
                        onChanged: (value) =>
                            registerFormProvider.email = value,
                        validator: (value) {
                          if (!EmailValidator.validate(value ?? ''))
                            return 'Email no valido';
                          return null;
                        },
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
                            registerFormProvider.password = value,
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
                          final validForm = registerFormProvider.validateForm();
                          if (!validForm) return;

                          //todo autprovider register
                          final authProvider =
                              Provider.of<AuthProvider>(context, listen: false);
                          authProvider.register(
                              registerFormProvider.email,
                              registerFormProvider.password,
                              registerFormProvider.name);
                        },
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
      }),
    );
  }
}
