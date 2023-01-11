import 'package:admin_dashboard/models/corredor.dart';
import 'package:admin_dashboard/providers/corredores_provider.dart';
import 'package:admin_dashboard/ui/views/menu_corredores_view.dart';
import 'package:date_field/date_field.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../services/notifications_service.dart';
import '../buttons/custom_outlined_button.dart';
import '../inputs/custom_inputs.dart';
import '../labels/custom_labels.dart';

class CorredoresModal extends StatefulWidget {
  final Corredore? corredore;
  final ScrollController? controller;
  final bool edit;
  const CorredoresModal(
      {Key? key, this.corredore, this.controller, required this.edit})
      : super(key: key);

  @override
  State<CorredoresModal> createState() => _CorredoresModal();
}

class _CorredoresModal extends State<CorredoresModal> {
  String id = '';
  String name = '';
  String lastname = '';
  String lastname2 = '';
  String runnerNumber = '';
  String email = '';
  String country = '';
  String state = '';
  String emergencyName = '';
  String emergencyNumber = '';
  String? licence;
  String municipality = '';
  String phoneNumber = '';
  DateTime? birthDate;
  String picture = '';
  String sex = '';
  String team = '';

  @override
  void initState() {
    super.initState();
    id = widget.corredore?.id ?? '';
    name = widget.corredore?.name ?? '';
    lastname = widget.corredore?.lastname ?? '';
    lastname2 = widget.corredore?.lastname2 ?? '';
    runnerNumber = widget.corredore?.runnerNumber ?? '';
    email = widget.corredore?.email ?? '';
    country = widget.corredore?.country ?? '';
    state = widget.corredore?.state ?? '';
    emergencyName = widget.corredore?.emergencyName ?? '';
    emergencyNumber = widget.corredore?.emergencyNumber ?? '';
    licence = widget.corredore?.licence ?? '';
    municipality = widget.corredore?.municipality ?? '';
    phoneNumber = widget.corredore?.phoneNumber ?? '';
    birthDate = widget.corredore?.birthDate;
    picture = widget.corredore?.img ?? '';
    sex = widget.corredore?.sex ?? '';
    team = widget.corredore?.team ?? '';
  }

  @override
  Widget build(BuildContext context) {
    List<String> lista = <String>["Masculino", "Femenino"];
    final corredoresProvider =
        Provider.of<CorredoresProvider>(context, listen: false);
    ScrollController controller =
        ScrollController(keepScrollOffset: true, initialScrollOffset: 0.0);
    controller.createScrollPosition;
    String textini;
    if (widget.edit == false) {
      textini = 'Registrar corredor';
    } else {
      textini = 'Actualizar corredor: ${widget.corredore!.name}';
    }

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: buildBoxDecoration(),
        child: ListView(
          itemExtent: 90,
          controller: controller,
          padding: EdgeInsets.all(10),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(textini,
                    style: CustomLabels.h1
                        .copyWith(color: Color.fromARGB(255, 58, 55, 55))),
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: Icon(
                    Icons.close,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            TextFormField(
              initialValue: widget.corredore?.name ?? name,
              onChanged: (value) => name = value,
              decoration: CustomInputs.loginInputDecoration(
                  hint: name ?? 'Ingrese el nombre del corredor',
                  label: 'Ingrese su nombre',
                  icon: Icons.new_releases_outlined),
            ),
            TextFormField(
              initialValue: widget.corredore?.lastname ?? lastname,
              onChanged: (value) => lastname = value,
              decoration: CustomInputs.loginInputDecoration(
                  hint: lastname ?? 'Ingrese su Apellido paterno',
                  label: 'Ingrese su pellido paterno',
                  icon: Icons.new_releases_outlined),
            ),
            TextFormField(
              initialValue: widget.corredore?.lastname2 ?? lastname2,
              onChanged: (value) => lastname2 = value,
              decoration: CustomInputs.loginInputDecoration(
                  hint: lastname2 ?? 'Ingrese su Apellido materno',
                  label: 'Ingrese su apellido materno',
                  icon: Icons.new_releases_outlined),
            ),
            TextFormField(
              initialValue: widget.corredore?.runnerNumber ?? runnerNumber,
              onChanged: (value) => runnerNumber = value,
              decoration: CustomInputs.loginInputDecoration(
                  hint: runnerNumber ?? 'Ingrese su numero',
                  label: 'Ingrese el numero del corredor',
                  icon: Icons.new_releases_outlined),
            ),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (!EmailValidator.validate(value ?? ''))
                  return 'Email no valido';
                return null;
              },
              initialValue: widget.corredore?.email ?? email,
              onChanged: (value) => email = value,
              decoration: CustomInputs.loginInputDecoration(
                hint: email ?? 'Correo Electronico',
                label: 'Ingrese su correo electronico',
                icon: Icons.new_releases_outlined,
              ),
            ),
            TextFormField(
              initialValue: widget.corredore?.country ?? country,
              onChanged: (value) => country = value,
              decoration: CustomInputs.loginInputDecoration(
                  hint: country ?? 'Ingrese su Pais',
                  label: 'Pais',
                  icon: Icons.new_releases_outlined),
            ),
            TextFormField(
              initialValue: widget.corredore?.state ?? state,
              onChanged: (value) => state = value,
              decoration: CustomInputs.loginInputDecoration(
                  hint: state ?? 'Ingrese su Estado',
                  label: 'Estado',
                  icon: Icons.new_releases_outlined),
            ),
            TextFormField(
              initialValue: widget.corredore?.emergencyName ?? emergencyName,
              onChanged: (value) => emergencyName = value,
              decoration: CustomInputs.loginInputDecoration(
                  hint: emergencyName ??
                      'Ingrese su nombre de contacto de emergencia',
                  label: 'Contacto Emergencia',
                  icon: Icons.new_releases_outlined),
            ),
            TextFormField(
              initialValue:
                  widget.corredore?.emergencyNumber ?? emergencyNumber,
              onChanged: (value) => emergencyNumber = value,
              decoration: CustomInputs.loginInputDecoration(
                  hint: emergencyNumber ?? 'Ingrese su numero de emergencia',
                  label: 'Numero de emeregencia',
                  icon: Icons.new_releases_outlined),
            ),
            TextFormField(
              initialValue: widget.corredore?.licence ?? licence,
              onChanged: (value) => licence = value,
              decoration: CustomInputs.loginInputDecoration(
                  hint: licence ?? 'Ingrese su licencia',
                  label: 'Licencia',
                  icon: Icons.new_releases_outlined),
            ),
            TextFormField(
              initialValue: widget.corredore?.municipality ?? municipality,
              onChanged: (value) => municipality = value,
              decoration: CustomInputs.loginInputDecoration(
                  hint: municipality ?? 'Ingrese su municipio',
                  label: 'Municipio',
                  icon: Icons.new_releases_outlined),
            ),
            TextFormField(
              initialValue: widget.corredore?.phoneNumber ?? phoneNumber,
              onChanged: (value) => phoneNumber = value,
              decoration: CustomInputs.loginInputDecoration(
                  hint: phoneNumber ?? 'Ingrese su telefono',
                  label: 'Ingrese su numero telefonico',
                  icon: Icons.new_releases_outlined),
            ),
            DateTimeFormField(
              decoration: const InputDecoration(
                hintStyle: TextStyle(color: Colors.black),
                errorStyle: TextStyle(color: Colors.redAccent),
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.event_note),
                labelText: 'Seleccione su fecha de nacimiento',
              ),
              mode: DateTimeFieldPickerMode.date,
              autovalidateMode: AutovalidateMode.always,
              validator: (e) =>
                  (e?.day ?? 0) == 1 ? 'Please not the first day' : null,
              initialValue: widget.corredore?.birthDate ?? birthDate,
              onDateSelected: (DateTime value) {
                birthDate = value;
              },
            ),
            DropdownButtonFormField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                      width: 1, color: Colors.black.withOpacity(0.6)),
                ),
              ),
              items: lista.map((acon) {
                return DropdownMenuItem(
                    value: lista.elementAt(lista.indexOf(acon)),
                    child: Text(acon));
              }).toList(),
              onChanged: (value) => sex = value!,
              hint: Text("Seleccione su sexo"),
            ),
            TextFormField(
              initialValue: widget.corredore?.team ?? team,
              onChanged: (value) => team = value,
              decoration: CustomInputs.loginInputDecoration(
                  hint: team ?? 'Ingrese su equipo(si tiene uno)',
                  label: 'Equipo',
                  icon: Icons.new_releases_outlined),
            ),
            Container(
              margin: EdgeInsets.only(top: 30),
              alignment: Alignment.center,
              child: CustomOutlinedButton(
                onPressed: () async {
                  try {
                    if (widget.edit == true) {
                      await corredoresProvider.updateCorredor(
                        id,
                        email,
                        phoneNumber,
                        name,
                        lastname,
                        lastname2,
                        sex,
                        birthDate ?? DateTime.now(),
                        licence ?? '',
                        team,
                        country,
                        state,
                        municipality,
                        runnerNumber,
                        picture,
                        emergencyNumber,
                        emergencyName,
                      );
                      NotificationsService.showSnackbar('$name Actualizado');
                    } else {
                      await corredoresProvider.newCorredor(
                          name,
                          lastname,
                          lastname2,
                          runnerNumber,
                          email,
                          country,
                          state,
                          emergencyName,
                          emergencyNumber,
                          licence,
                          municipality,
                          phoneNumber,
                          birthDate ?? DateTime.now(),
                          picture,
                          sex,
                          team);

                      NotificationsService.showSnackbar('$name Creado!');
                    }
                  } catch (e) {
                    NotificationsService.showSnackbar(
                        'No se pudo guardar el evento');
                  }
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Menu_CorredoresView()),
                  );
                },
                text: textini,
                color: Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => BoxDecoration(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      color: Color.fromARGB(179, 250, 241, 228));
}
