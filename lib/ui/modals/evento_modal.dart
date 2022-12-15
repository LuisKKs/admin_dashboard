import 'package:admin_dashboard/ui/views/menu_eventosView.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:date_field/date_field.dart';
import '../../providers/tipo_carrera_provider.dart';
import 'package:admin_dashboard/providers/eventos_provider.dart';
import 'package:admin_dashboard/models/evento.dart';
import 'package:admin_dashboard/models/carrera.dart';
import 'package:admin_dashboard/ui/buttons/custom_outlined_button.dart';
import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';

class EventoModal extends StatefulWidget {
  final Evento? evento;
  final String? idEvento;
  final ScrollController? controller;
  final Racetype? tipo;
  final bool edit;
  const EventoModal(
      {Key? key,
      this.evento,
      this.controller,
      this.tipo,
      required this.edit,
      this.idEvento})
      : super(key: key);

  @override
  State<EventoModal> createState() => _EventoModalState();
}

class _EventoModalState extends State<EventoModal> {
  String id = '';
  String shortName = '';
  String eventName = '';
  DateTime? dateStart;
  DateTime? dateFinish;
  String eventHour = '';
  String? logo;
  String organizer = '';
  String email = '';
  String phone = '';
  String? website = '';
  String? country = '';
  String? stateCountry = '';
  String? raceType = '';

  @override
  void initState() {
    super.initState();
    id = widget.evento?.id ?? '';
    shortName = widget.evento?.shortName ?? '';
    eventName = widget.evento?.eventName ?? '';
    dateStart = widget.evento?.dateStart;
    dateFinish = widget.evento?.dateFinish;
    eventHour = widget.evento?.eventHour ?? '';
    logo = widget.evento?.logo ?? '';
    organizer = widget.evento?.organizer ?? '';
    email = widget.evento?.email ?? '';
    phone = widget.evento?.phone ?? '';
    website = widget.evento?.website;
    country = widget.evento?.country;
    stateCountry = widget.evento?.stateCountry;
    //raceType = widget.evento?.raceType.id;
    raceType = widget.tipo?.id;
  }

  @override
  void didChangeDependencies() {
    Provider.of<CatCarreraProvider>(context, listen: false).getCatCarrera();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final eventoProvider = Provider.of<EventosProvider>(context, listen: false);
    var categoriaPrueba = Provider.of<CatCarreraProvider>(context).racetypes;
    List<Racetype> listona = categoriaPrueba;
    List<String> listaprueba = <String>["BMX", "RUTA"];
    ScrollController controller =
        ScrollController(keepScrollOffset: true, initialScrollOffset: 0.0);
    controller.createScrollPosition;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: buildBoxDecoration(),
        child: ListView(
          itemExtent: 70,
          controller: controller,
          padding: EdgeInsets.all(10),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (widget.edit == false)
                  Text('Nuevo evento',
                      style: CustomLabels.h1
                          .copyWith(color: Color.fromARGB(255, 58, 55, 55)))
                else
                  Text('Edicion de evento:${widget.evento!.id}',
                      style: CustomLabels.h1
                          .copyWith(color: Color.fromARGB(255, 58, 55, 55))),
                IconButton(
                    icon: Icon(
                      Icons.close,
                      color: Colors.white,
                    ),
                    onPressed: () => Navigator.of(context).pop())
              ],
            ),
            TextFormField(
              initialValue: widget.evento?.eventName ?? eventName,
              onChanged: (value) => eventName = value,
              decoration: CustomInputs.loginInputDecoration(
                hint: eventName ?? 'Nombre del evento',
                label: 'Evento',
                icon: Icons.new_releases_outlined,
              ),
            ),
            TextFormField(
              initialValue: widget.evento?.shortName ?? shortName,
              onChanged: (value) => shortName = value,
              decoration: CustomInputs.loginInputDecoration(
                hint: shortName ?? 'Nombre Corto del Evento',
                label: 'Siglas',
                icon: Icons.new_releases_outlined,
              ),
            ),
            DateTimeFormField(
              decoration: const InputDecoration(
                hintStyle: TextStyle(color: Colors.black),
                errorStyle: TextStyle(color: Colors.redAccent),
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.event_note),
                labelText: 'Fecha de inicio',
              ),
              mode: DateTimeFieldPickerMode.dateAndTime,
              autovalidateMode: AutovalidateMode.always,
              validator: (e) =>
                  (e?.day ?? 0) == 1 ? 'Please not the first day' : null,
              initialValue: widget.evento?.dateStart ?? dateStart,
              onDateSelected: (DateTime value) {
                dateStart = value;
              },
            ),
            DateTimeFormField(
              decoration: const InputDecoration(
                hintStyle: TextStyle(color: Colors.black),
                errorStyle: TextStyle(color: Colors.redAccent),
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.event_note),
                labelText: 'Fecha Final',
              ),
              mode: DateTimeFieldPickerMode.dateAndTime,
              autovalidateMode: AutovalidateMode.always,
              validator: (e) =>
                  (e?.day ?? 0) == 1 ? 'Please not the first day' : null,
              initialValue: widget.evento?.dateFinish ?? dateFinish,
              onDateSelected: (DateTime value) {
                dateFinish = value;
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
                    value: acon.id, child: Text(acon.typeName));
              }).toList(),
              onChanged: (value) => raceType = value,
              hint: Text("Seleccione El Tipo De Carrera"),
            ),
            TextFormField(
              initialValue: widget.evento?.eventHour ?? eventHour,
              onChanged: (value) => eventHour = value,
              decoration: CustomInputs.loginInputDecoration(
                hint: eventHour ?? 'Hora del evento',
                label: 'Hora "13:00"',
                icon: Icons.new_releases_outlined,
              ),
            ),
            TextFormField(
              initialValue: widget.evento?.organizer ?? organizer,
              onChanged: (value) => organizer = value,
              decoration: CustomInputs.loginInputDecoration(
                hint: organizer ?? 'Organizador',
                label: 'Organizadores',
                icon: Icons.new_releases_outlined,
              ),
            ),
            TextFormField(
              initialValue: widget.evento?.email ?? email,
              onChanged: (value) => email = value,
              decoration: CustomInputs.loginInputDecoration(
                hint: email ?? 'Correo Electronico',
                label: 'Ingrese su correo electronico',
                icon: Icons.new_releases_outlined,
              ),
            ),
            TextFormField(
              initialValue: widget.evento?.phone ?? phone,
              onChanged: (value) => phone = value,
              decoration: CustomInputs.loginInputDecoration(
                hint: phone ?? 'Numero de Telefono',
                label: 'Ingrese su numero de telefono',
                icon: Icons.new_releases_outlined,
              ),
            ),
            TextFormField(
              initialValue: widget.evento?.website ?? website,
              onChanged: (value) => website = value,
              decoration: CustomInputs.loginInputDecoration(
                hint: website ?? 'Sitio Web',
                label: 'Ingrese si tiene sitio web',
                icon: Icons.new_releases_outlined,
              ),
            ),
            TextFormField(
              initialValue: widget.evento?.country ?? country,
              onChanged: (value) => country = value,
              decoration: CustomInputs.loginInputDecoration(
                hint: country ?? 'Pais',
                label: 'Ingrese su Pais',
                icon: Icons.new_releases_outlined,
              ),
            ),
            TextFormField(
              initialValue: widget.evento?.stateCountry ?? stateCountry,
              onChanged: (value) => stateCountry = value,
              decoration: CustomInputs.loginInputDecoration(
                hint: stateCountry ?? 'Estado',
                label: 'Ingrese su estado',
                icon: Icons.new_releases_outlined,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30),
              alignment: Alignment.center,
              child: CustomOutlinedButton(
                onPressed: () async {
                  print(phone);
                  print(shortName);
                  print(dateStart);
                  print(dateFinish);
                  print(raceType);
                  print(eventHour);
                  print(logo);
                  print(organizer);
                  print(email);
                  print(website);
                  print(country);
                  print(stateCountry);
                  print(raceType);

                  if (widget.edit == true) {
                    await eventoProvider.updateEvento(
                        id,
                        phone,
                        shortName,
                        eventName,
                        dateStart ?? DateTime.now(),
                        dateFinish ?? DateTime.now(),
                        eventHour,
                        logo,
                        organizer,
                        email,
                        website,
                        country ?? '',
                        stateCountry ?? '',
                        raceType ?? '');
                    print("Actualizanding ... $id");
                  } else {
                    await eventoProvider.newEvento(
                        phone,
                        shortName,
                        eventName,
                        dateStart ?? DateTime.now(),
                        dateFinish ?? DateTime.now(),
                        eventHour,
                        logo,
                        organizer,
                        email,
                        website,
                        country ?? '',
                        stateCountry ?? '',
                        raceType ?? '');
                    print("Registranding");
                  }
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Menu_EventosView()),
                  );
                  //Navigator.pop(context);
                },
                text: 'Crear',
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
