import 'dart:io';

import 'package:admin_dashboard/models/carrera.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:date_field/date_field.dart';
import 'package:admin_dashboard/models/evento.dart';
import 'package:admin_dashboard/providers/eventos_provider.dart';
import 'package:admin_dashboard/ui/buttons/custom_outlined_button.dart';
import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import '../../providers/tipo_carrera_provider.dart';

class EventoModal extends StatefulWidget {
  final Evento? evento;
  const EventoModal({Key? key, this.evento}) : super(key: key);

  @override
  State<EventoModal> createState() => _EventoModalState();
}

class _EventoModalState extends State<EventoModal> {
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
    raceType = widget.evento?.raceType.typeName;
  }

  @override
  Widget build(BuildContext context) {
    final eventoProvider = Provider.of<EventosProvider>(context, listen: false);
    bool listenner = true;

    final categoriaPrueba =
        Provider.of<CatCarreraProvider>(context, listen: listenner);
    categoriaPrueba.getCatCarrera();
    listenner = false;
    List<Racetype> listona = categoriaPrueba.racetypes;

    List<String> listaprueba = <String>["BMX", "RUTA"];

    var items;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: buildBoxDecoration(),
        child: Scrollbar(
          child: ListView(
              physics: ClampingScrollPhysics(),
              padding: EdgeInsets.all(10),
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(widget.evento?.shortName ?? 'Nuevo Evento',
                        style: CustomLabels.h1.copyWith(color: Colors.white)),
                    IconButton(
                        icon: Icon(
                          Icons.close,
                          color: Colors.white,
                        ),
                        onPressed: () => Navigator.of(context).pop())
                  ],
                ),
                Divider(color: Colors.white.withOpacity(0.3)),
                SizedBox(height: 10),
                TextFormField(
                  initialValue: widget.evento?.eventName ?? '',
                  onChanged: (value) => eventName = value,
                  decoration: CustomInputs.loginInputDecoration(
                    hint: 'Nombre del evento',
                    label: 'Evento',
                    icon: Icons.new_releases_outlined,
                  ),
                ),
                Divider(color: Colors.white.withOpacity(0.3)),
                SizedBox(height: 10),
                TextFormField(
                  initialValue: widget.evento?.shortName ?? '',
                  onChanged: (value) => shortName = value,
                  decoration: CustomInputs.loginInputDecoration(
                    hint: 'Nombre Corto del Evento',
                    label: 'Siglas',
                    icon: Icons.new_releases_outlined,
                  ),
                ),
                Divider(color: Colors.white.withOpacity(0.3)),
                SizedBox(height: 10),
                DateTimeFormField(
                  decoration: const InputDecoration(
                    ///
                    //  *Decoracion del datetime input
                    ///
                    hintStyle: TextStyle(color: Colors.black),
                    errorStyle: TextStyle(color: Colors.redAccent),
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.event_note),
                    labelText: 'Fecha de inicio',
                  ),
                  mode: DateTimeFieldPickerMode
                      .dateAndTime, // Selector de tipo de datetime .dateAndTime = fecha y hora, date = fecha, time = hora.
                  autovalidateMode: AutovalidateMode.always,
                  validator: (e) =>
                      (e?.day ?? 0) == 1 ? 'Please not the first day' : null,
                  initialValue: widget.evento?.dateStart ?? dateStart,
                  onDateSelected: (DateTime value) {
                    dateStart =
                        value; //al momento de acabar de seleccionar la fecha se guarda en la variable local correspondiente
                  },
                ),
                Divider(color: Colors.white.withOpacity(0.3)),
                SizedBox(height: 10),
                DateTimeFormField(
                  decoration: const InputDecoration(
                    ///
                    //  *Decoracion del datetime input
                    ///
                    hintStyle: TextStyle(color: Colors.black),
                    errorStyle: TextStyle(color: Colors.redAccent),
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.event_note),
                    labelText: 'Fecha Final',
                  ),

                  mode: DateTimeFieldPickerMode
                      .dateAndTime, // Selector de tipo de datetime .dateAndTime = fecha y hora, date = fecha, time = hora.
                  autovalidateMode: AutovalidateMode.always,
                  validator: (e) =>
                      (e?.day ?? 0) == 1 ? 'Please not the first day' : null,
                  initialValue: widget.evento?.dateFinish ?? dateFinish,
                  onDateSelected: (DateTime value) {
                    dateFinish =
                        value; //al momento de acabar de seleccionar la fecha se guarda en la variable local correspondiente
                  },
                ),
                Divider(color: Colors.white.withOpacity(0.3)),
                SizedBox(height: 10),
                DropdownButtonFormField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                          width: 1, color: Colors.black.withOpacity(0.6)),
                    ),
                  ),
                  items: listona.map((acon) {
                    //mando a llamar la lista que cree para mapearla
                    return DropdownMenuItem(
                        value: acon.typeName, child: Text(acon.typeName));
                    //aqui se despliega el menu con campo vacio
                  }).toList(),
                  onChanged: (value) {},
                  hint: Text("Seleccione El Tipo De Carrera"),
                ),
                Divider(color: Colors.white.withOpacity(0.3)),
                SizedBox(height: 10),
                TextFormField(
                  initialValue: widget.evento?.eventHour ?? '',
                  onChanged: (value) => eventHour = value,
                  decoration: CustomInputs.loginInputDecoration(
                    hint: 'Hora del evento',
                    label: 'Hora "13:00"',
                    icon: Icons.new_releases_outlined,
                  ),
                ),
                Divider(color: Colors.white.withOpacity(0.3)),
                SizedBox(height: 10),
                TextFormField(
                  initialValue: widget.evento?.organizer ?? '',
                  onChanged: (value) => organizer = value,
                  decoration: CustomInputs.loginInputDecoration(
                    hint: 'Organizador',
                    label: 'Organizadores',
                    icon: Icons.new_releases_outlined,
                  ),
                ),
                Divider(color: Colors.white.withOpacity(0.3)),
                SizedBox(height: 10),
                TextFormField(
                  initialValue: widget.evento?.email ?? '',
                  onChanged: (value) => email = value,
                  decoration: CustomInputs.loginInputDecoration(
                    hint: 'Correo Electronico',
                    label: 'Ingrese su correo electronico',
                    icon: Icons.new_releases_outlined,
                  ),
                ),
                Divider(color: Colors.white.withOpacity(0.3)),
                SizedBox(height: 10),
                TextFormField(
                  initialValue: widget.evento?.phone ?? '',
                  onChanged: (value) => phone = value,
                  decoration: CustomInputs.loginInputDecoration(
                    hint: 'Numero de Telefono',
                    label: 'Ingrese su numero de telefono',
                    icon: Icons.new_releases_outlined,
                  ),
                ),
                Divider(color: Colors.white.withOpacity(0.3)),
                SizedBox(height: 10),
                TextFormField(
                  initialValue: widget.evento?.website ?? '',
                  onChanged: (value) => website = value,
                  decoration: CustomInputs.loginInputDecoration(
                    hint: 'Sitio Web',
                    label: 'Ingrese si tiene sitio web',
                    icon: Icons.new_releases_outlined,
                  ),
                ),
                Divider(color: Colors.white.withOpacity(0.3)),
                SizedBox(height: 10),
                TextFormField(
                  initialValue: widget.evento?.country ?? '',
                  onChanged: (value) => country = value,
                  decoration: CustomInputs.loginInputDecoration(
                    hint: 'Pais',
                    label: 'Ingrese su Pais',
                    icon: Icons.new_releases_outlined,
                  ),
                ),
                Divider(color: Colors.white.withOpacity(0.3)),
                SizedBox(height: 10),
                TextFormField(
                  initialValue: widget.evento?.stateCountry ?? '',
                  onChanged: (value) => stateCountry = value,
                  decoration: CustomInputs.loginInputDecoration(
                    hint: 'Estado',
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

                      if (eventName != null) {
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
                        print("si entra");
                      } else {
                        //actualizar
                      }
                      Navigator.of(context).pop();
                    },
                    text: 'Guardar',
                    color: Colors.black,
                  ),
                )
              ]),
        ),
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => BoxDecoration(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      image:
          DecorationImage(image: AssetImage('fondo1.png'), fit: BoxFit.cover));
}
