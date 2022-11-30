import 'package:admin_dashboard/models/evento.dart';
import 'package:admin_dashboard/ui/buttons/custom_outlined_button.dart';
import 'package:admin_dashboard/ui/cards/white_card.dart';
import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';
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
                  initialValue: widget.evento?.eventName ?? '',
                  onChanged: (value) => eventName = value,
                  decoration: CustomInputs.loginInputDecoration(
                    hint: 'Nombre del evento',
                    label: 'Evento',
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
