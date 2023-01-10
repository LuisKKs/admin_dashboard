import 'package:admin_dashboard/providers/carreras_provider.dart';
import 'package:admin_dashboard/providers/eventos_provider.dart';
import 'package:admin_dashboard/ui/views/menu_carrerasView.dart';
import 'package:date_field/date_field.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/carrerasprin.dart';
import '../../models/evento.dart';
import '../../services/notifications_service.dart';
import '../buttons/custom_outlined_button.dart';
import '../inputs/custom_inputs.dart';
import '../labels/custom_labels.dart';

class CarrerasModal extends StatefulWidget {
  final Carrera? carrera;
  final ScrollController? controller;
  final Evento? evento;
  final bool edit;

  const CarrerasModal(
      {Key? key,
      this.carrera,
      this.controller,
      required this.edit,
      this.evento})
      : super(key: key);

  @override
  State<CarrerasModal> createState() => _CarrerasState();
}

class _CarrerasState extends State<CarrerasModal> {
  String id = '';
  String? event;
  String shortName = '';
  String? longName;
  DateTime? raceDate;
  String? raceHour;
  String? responsable;
  String? email;
  String? contactNumber;
  String? state;
  String? municipality;
  String location = '';
  String latitude = '';
  String altitude = '';
  String raceLink = '';

  String? validateMobile(String? value) {
    String? patttern = r'(^[0-9]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value?.length == 0) {
      return "El telefono es necesario";
    } else if (value?.length != 10) {
      return "El numero debe tener 10 digitos";
    }
    return null;
  }

  @override
  void initState() {
    super.initState();
    Provider.of<EventosProvider>(context, listen: false).getEventos();
    id = widget.carrera?.id ?? '';
    event = widget.evento?.id;
    shortName = widget.carrera?.shortName ?? '';
    longName = widget.carrera?.longName ?? '';
    raceDate = widget.carrera?.raceDate;
    raceHour = widget.carrera?.raceHour;
    responsable = widget.carrera?.responsable;
    email = widget.carrera?.email;
    contactNumber = widget.carrera?.contactNumber;
    state = widget.carrera?.state;
    municipality = widget.carrera?.municipality;
    location = widget.carrera?.location ?? '';
    latitude = widget.carrera?.latitude ?? '';
    altitude = widget.carrera?.altitude ?? '';
    raceLink = widget.carrera?.raceLink ?? '';
  }

  //@override
  //void didChangeDependencies() {
  //  Provider.of<EventosProvider>(context, listen: false).getEventos();
  //  super.didChangeDependencies();
  //}

  @override
  Widget build(BuildContext context) {
    final carreraProvider =
        Provider.of<CarrerasProvider>(context, listen: false);
    var eventoPrueba = Provider.of<EventosProvider>(context).eventos;
    List<Evento> listona = eventoPrueba;
    ScrollController controller =
        ScrollController(keepScrollOffset: true, initialScrollOffset: 0.0);
    controller.createScrollPosition;
    String textini;
    if (widget.edit == false) {
      textini = 'Registrar carrera';
    } else {
      textini = 'Actualizar carrera: ${widget.carrera!.longName}';
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
                    icon: Icon(
                      Icons.close,
                      color: Colors.black,
                    ),
                    onPressed: () => Navigator.of(context).pop())
              ],
            ),
            TextFormField(
              initialValue: widget.carrera?.longName ?? longName,
              onChanged: (value) => longName = value,
              decoration: CustomInputs.loginInputDecoration(
                hint: longName ?? 'Ingrese el nombre completo de la carrera',
                label: 'Carrera',
                icon: Icons.new_releases_outlined,
              ),
            ),
            TextFormField(
              initialValue: widget.carrera?.shortName ?? shortName,
              onChanged: (value) => shortName = value,
              decoration: CustomInputs.loginInputDecoration(
                hint: shortName ??
                    'Ingrese el nombre corto o siglas de la carrera',
                label: 'Nombre Corto',
                icon: Icons.new_releases_outlined,
              ),
            ),
            DateTimeFormField(
              decoration: const InputDecoration(
                hintStyle: TextStyle(color: Colors.black),
                errorStyle: TextStyle(color: Colors.redAccent),
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.event_note),
                labelText: 'Fecha de carrera',
              ),
              mode: DateTimeFieldPickerMode.date,
              autovalidateMode: AutovalidateMode.always,
              validator: (e) =>
                  (e?.day ?? 0) == 1 ? 'Please not the first day' : null,
              initialValue: widget.carrera?.raceDate ?? raceDate,
              onDateSelected: (DateTime value) {
                raceDate = value;
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
              items: listona.map((acon) {
                return DropdownMenuItem(
                    value: acon.id, child: Text(acon.eventName));
              }).toList(),
              onChanged: (value) => event = value,
              hint: Text("Seleccione El Tipo De Carrera"),
            ),
            TextFormField(
              initialValue: widget.carrera?.raceHour ?? raceHour,
              onChanged: (value) => raceHour = value,
              decoration: CustomInputs.loginInputDecoration(
                hint: raceHour ?? 'Hora del evento',
                label: 'Hora "13:00"',
                icon: Icons.new_releases_outlined,
              ),
            ),
            TextFormField(
              initialValue: widget.carrera?.responsable ?? responsable,
              onChanged: (value) => responsable = value,
              decoration: CustomInputs.loginInputDecoration(
                hint: responsable ?? 'Responsable',
                label: 'Rsponsables',
                icon: Icons.new_releases_outlined,
              ),
            ),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (!EmailValidator.validate(value ?? ''))
                  return 'Email no valido';
                return null;
              },
              initialValue: widget.carrera?.email ?? email,
              onChanged: (value) => email = value,
              decoration: CustomInputs.loginInputDecoration(
                hint: email ?? 'Correo Electronico',
                label: 'Ingrese su correo electronico',
                icon: Icons.new_releases_outlined,
              ),
            ),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: validateMobile,
              initialValue: widget.carrera?.contactNumber ?? contactNumber,
              onChanged: (value) => contactNumber = value,
              decoration: CustomInputs.loginInputDecoration(
                hint: contactNumber ?? 'Numero de Telefono',
                label: 'Telefono',
                icon: Icons.new_releases_outlined,
              ),
            ),
            TextFormField(
              initialValue: widget.carrera?.raceLink ?? raceLink,
              onChanged: (value) => raceLink = value,
              decoration: CustomInputs.loginInputDecoration(
                hint: raceLink ?? 'Sitio Web',
                label: ' Ingrese sitio web (en caso de haber)',
                icon: Icons.new_releases_outlined,
              ),
            ),
            TextFormField(
              textCapitalization: TextCapitalization.words,
              initialValue: widget.carrera?.location ?? location,
              onChanged: (value) => location = value,
              decoration: CustomInputs.loginInputDecoration(
                hint: location ?? 'Localizacion',
                label: 'Locaclizacion',
                icon: Icons.new_releases_outlined,
              ),
            ),
            TextFormField(
              textCapitalization: TextCapitalization.words,
              initialValue: widget.carrera?.altitude ?? altitude,
              onChanged: (value) => altitude = value,
              decoration: CustomInputs.loginInputDecoration(
                hint: altitude ?? 'Altitud',
                label: 'Altitud',
                icon: Icons.new_releases_outlined,
              ),
            ),
            TextFormField(
              textCapitalization: TextCapitalization.words,
              initialValue: widget.carrera?.latitude ?? latitude,
              onChanged: (value) => latitude = value,
              decoration: CustomInputs.loginInputDecoration(
                hint: latitude ?? 'Latitud',
                label: 'Latitud',
                icon: Icons.new_releases_outlined,
              ),
            ),
            TextFormField(
              textCapitalization: TextCapitalization.words,
              initialValue: widget.carrera?.municipality ?? municipality,
              onChanged: (value) => municipality = value,
              decoration: CustomInputs.loginInputDecoration(
                hint: municipality ?? 'Municipio',
                label: 'Municipio',
                icon: Icons.new_releases_outlined,
              ),
            ),
            TextFormField(
              textCapitalization: TextCapitalization.words,
              initialValue: widget.carrera?.state ?? state,
              onChanged: (value) => state = value,
              decoration: CustomInputs.loginInputDecoration(
                hint: state ?? 'Estado',
                label: 'Estado',
                icon: Icons.new_releases_outlined,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30),
              alignment: Alignment.center,
              child: CustomOutlinedButton(
                onPressed: () async {
                  try {
                    if (widget.edit == true) {
                      await carreraProvider.updateCarrera(
                          id,
                          event ?? '',
                          shortName,
                          longName ?? '',
                          raceDate ?? DateTime.now(),
                          raceHour ?? '',
                          responsable ?? '',
                          email ?? '',
                          contactNumber ?? '',
                          state ?? '',
                          municipality ?? '',
                          location,
                          latitude,
                          altitude,
                          raceLink);

                      NotificationsService.showSnackbar(
                          '$longName Actualizado!');
                    } else {
                      await carreraProvider.newCarrera(
                          event ?? '',
                          shortName,
                          longName ?? '',
                          raceDate ?? DateTime.now(),
                          raceHour ?? '',
                          responsable ?? '',
                          email ?? '',
                          contactNumber ?? '',
                          state ?? '',
                          municipality ?? '',
                          location,
                          latitude,
                          altitude,
                          raceLink);
                      NotificationsService.showSnackbar('$longName Creado!');
                    }
                  } catch (e) {
                    NotificationsService.showSnackbarError(
                        'No se pudo guardar la carrera');
                  }
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Menu_CarrerasView()),
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
