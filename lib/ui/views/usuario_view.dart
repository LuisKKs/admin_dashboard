import 'package:admin_dashboard/models/usuarios.dart';
import 'package:admin_dashboard/providers/user_form_provider.dart';
import 'package:admin_dashboard/providers/usuarios_provider.dart';
import 'package:admin_dashboard/services/notifications_service.dart';
import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:email_validator/email_validator.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../services/navigation_service.dart';
import '../cards/white_card.dart';

class UsuarioView extends StatefulWidget {
  final String uid;

  const UsuarioView({Key? key, required this.uid}) : super(key: key);

  @override
  State<UsuarioView> createState() => _UsuarioViewState();
}

class _UsuarioViewState extends State<UsuarioView> {
  Usuario? user;

  @override
  void initState() {
    super.initState();

    final usersProvider = Provider.of<UsuariosProvider>(context, listen: false);
    final userFromProvider =
        Provider.of<UserFormProvider>(context, listen: false);

    usersProvider.getUserById(widget.uid).then((userDB) {
      userFromProvider.user = userDB;

      setState(() {
        this.user = userDB;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ListView(
          physics: ClampingScrollPhysics(),
          children: [
            Text('User view', style: CustomLabels.h1),
            SizedBox(height: 10),
            if (user == null)
              WhiteCard(
                  child: Container(
                alignment: Alignment.center,
                height: 300,
                child: CircularProgressIndicator(),
              )),
            if (user != null) _UserViewBody()
          ],
        ));
  }
}

class _UserViewBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Table(
        columnWidths: {0: FixedColumnWidth(150)},
        children: [
          TableRow(children: [
            _AvatarContainer(), //avatr
            _UserViewForm(), //form
          ])
        ],
      ),
    );
  }
}

class _UserViewForm extends StatelessWidget {
  const _UserViewForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userFormProvider = Provider.of<UserFormProvider>(context);
    final user = userFormProvider.user;

    var listona = [
      'Administrador',
      'Manager evento',
      'Manager carrera',
      'Usuario'
    ];
    var listonaVAL = [
      'ADMIN_ROLE',
      'EMANAGER_ROLE',
      'CMANAGER_ROLE',
      'USER_ROLE'
    ];
    return WhiteCard(
      title: 'Info general',
      child: Form(
        key: userFormProvider.formKey,
        autovalidateMode: AutovalidateMode.always,
        child: Column(
          children: [
            TextFormField(
                initialValue: user!.name,
                decoration: CustomInputs.formInputDecoration(
                    hint: 'Nombre del Usuario',
                    label: 'Nombre',
                    icon: Icons.person_outline_outlined),
                onChanged: (value) =>
                    userFormProvider.copyUserWith(name: value),
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return 'Ingrese su nombre.';
                  if (value.length < 3)
                    return 'El nombre debe de ser de tres letras como minimo.';
                  return null;
                }),
            SizedBox(height: 20),
            TextFormField(
              initialValue: user.lastname,
              decoration: CustomInputs.formInputDecoration(
                  hint: 'Apellidos del usuario',
                  label: 'Apellidos',
                  icon: Icons.supervised_user_circle_outlined),
              onChanged: (value) => user.lastname = value,
              validator: ((value) {
                if (value == null || value.isEmpty)
                  return 'Ingrese su Apellidos.';
                if (value.length < 3)
                  return 'El apellido debe de ser de tres letras como minimo.';
              }),
            ),
            SizedBox(height: 20),
            TextFormField(
              initialValue: user.email,
              decoration: CustomInputs.formInputDecoration(
                  hint: 'Correo del usuario',
                  label: 'Correo',
                  icon: Icons.email_outlined),
              onChanged: (value) => user.email = value,
              validator: ((value) {
                if (!EmailValidator.validate(value ?? ''))
                  return 'Email no valido';
                return null;
              }),
            ),
            SizedBox(height: 20),
            TextFormField(
              initialValue: user.phonenumber,
              decoration: CustomInputs.formInputDecoration(
                  hint: 'Telefono del usuario',
                  label: 'Telefono',
                  icon: Icons.phone_android_outlined),
              onChanged: (value) => user.phonenumber = value,
              validator: ((value) {
                if (value == null || value.isEmpty)
                  return 'Ingrese su telefono.';
                if (value.length > 10 || value.length < 10)
                  return 'El numero debe contener 10 digitos.';
              }),
            ),
            SizedBox(height: 20),
            DropdownButtonFormField(
              decoration: CustomInputs.formInputDecoration(
                  hint: user.role,
                  label: 'Rol de usuario',
                  icon: Icons.supervised_user_circle_outlined),
              items: listona.map((acon) {
                return DropdownMenuItem(
                    value: listonaVAL.elementAt(listona.indexOf(acon)),
                    child: Text('${acon}'));
              }).toList(),
              onChanged: (value) => user.role = value as String,
            ),
            SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    //act usuario
                    final saved = await userFormProvider.upDateUser();
                    if (saved) {
                      NotificationsService.showSnackbar('Usuario actualizado');
                      Provider.of<UsuariosProvider>(context, listen: false)
                          .refreshUser(user);
                    } else {
                      NotificationsService.showSnackbar('No se pudo guardar');
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.indigo),
                    shadowColor: MaterialStateProperty.all(Colors.transparent),
                  ),
                  child: Row(children: [
                    Icon(
                      Icons.save_alt_outlined,
                      size: 25,
                    ),
                    Text(' Guardar')
                  ]),
                ),
                ElevatedButton(
                  onPressed: () {
                    NavigationService.replaceTo(
                        '/dasboard/Administracion De Usuarios');
                    /*Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Admin_UsuariosView()),
                    );*/
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.indigo),
                    shadowColor: MaterialStateProperty.all(Colors.transparent),
                  ),
                  child: Row(children: [
                    Icon(
                      Icons.exit_to_app_outlined,
                      size: 25,
                    ),
                    Text(' regresar')
                  ]),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _AvatarContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userFormProvider = Provider.of<UserFormProvider>(context);
    final user = userFormProvider.user;

    final image = (user?.img == null)
        ? Image(image: AssetImage('no-image.jpg'))
        : FadeInImage.assetNetwork(placeholder: 'loader.gif', image: user!.img);

    return WhiteCard(
      widht: 250,
      child: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('perfil', style: CustomLabels.h2),
            SizedBox(height: 20),
            Container(
              width: 260,
              height: 260,
              child: Stack(
                children: [
                  ClipOval(child: image),
                  Positioned(
                    bottom: 5,
                    right: 5,
                    child: Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(150),
                          border: Border.all(color: Colors.white, width: 5)),
                      child: FloatingActionButton(
                        backgroundColor: Colors.indigo,
                        elevation: 0,
                        child: Icon(Icons.camera_alt_outlined, size: 20),
                        onPressed: () async {
                          FilePickerResult? result = await FilePicker.platform
                              .pickFiles(
                                  type: FileType.custom,
                                  allowedExtensions: ['jpg', 'jpeg', 'png'],
                                  allowMultiple: false);

                          if (result != null) {
                            //PlatformFile file = result.files.first;
                            NotificationsService.showBusyIndicator(context);
                            final resp = await userFormProvider.uploadImage(
                                '/uploads/usuarios/${user?.uid}',
                                result.files.first.bytes!);

                            Provider.of<UsuariosProvider>(context,
                                    listen: false)
                                .refreshUser(resp);

                            Navigator.of(context).pop();
                          } else {
                            print('no hay imagen');
                          }
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              user!.name,
              style: TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
