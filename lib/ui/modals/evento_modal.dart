import 'package:admin_dashboard/models/evento.dart';
import 'package:admin_dashboard/ui/buttons/custom_outlined_button.dart';
import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';

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
                /*TextFormField(
                  initialValue: widget.evento?.dateStart ?? '',
                  keyboardType: TextInputType.datetime,
                  decoration: InputDecoration(
                    icon: Icon(Icons.calendar_month_outlined),
                    labelText: 'Fecha inicio',
                    helperText: 'DD / MM / AAAA',
                    isDense: false,
                    contentPadding: EdgeInsets.all(10),
                  ),
                ), */

                /*TextFormField(
                  initialValue: widget.evento?.eventName ?? '',
                  onChanged: (value) => eventName = value,
                  decoration: CustomInputs.loginInputDecoration(
                    hint: 'Nombre del evento',
                    label: 'Evento',
                    icon: Icons.new_releases_outlined,
                  ),
                ), */
                DateTimeFormField(
                  decoration: const InputDecoration(
                    hintStyle: TextStyle(color: Colors.black45),
                    errorStyle: TextStyle(color: Colors.redAccent),
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.event_note),
                    labelText: 'Only time',
                  ),
                  mode: DateTimeFieldPickerMode.dateAndTime,
                  autovalidateMode: AutovalidateMode.always,
                  validator: (e) =>
                      (e?.day ?? 0) == 1 ? 'Please not the first day' : null,
                  onDateSelected: (DateTime value) {
                    print(value);
                  },
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
                  initialValue: widget.evento?.eventHour ?? '',
                  onChanged: (value) => eventHour = value,
                  decoration: CustomInputs.loginInputDecoration(
                    hint: 'Hora del evento',
                    label: 'Hora',
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
                    onPressed: () async {},
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
