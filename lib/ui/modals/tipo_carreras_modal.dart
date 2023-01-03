import 'package:admin_dashboard/providers/tipo_carrera_provider.dart';
import 'package:admin_dashboard/services/notifications_service.dart';
import 'package:admin_dashboard/ui/buttons/custom_outlined_button.dart';
import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:provider/provider.dart';

import '../../models/carrera.dart';
import 'package:flutter/material.dart';

import '../views/tipos_carreras_view.dart';

class TipoCarrerasModal extends StatefulWidget {
  final Racetype? tipcar;
  final ScrollController? controller;
  final bool edit;
  const TipoCarrerasModal(
      {Key? key, this.tipcar, this.controller, required this.edit})
      : super(key: key);

  @override
  State<TipoCarrerasModal> createState() => _TipoCarrerasModal();
}

class _TipoCarrerasModal extends State<TipoCarrerasModal> {
  String typeName = '';
  String description = '';
  String id = '';

  @override
  void initState() {
    super.initState();
    typeName = widget.tipcar?.typeName ?? '';
    description = widget.tipcar?.description ?? '';
    id = widget.tipcar?.id ?? '';
  }

  @override
  void didChangeDependencies() {
    Provider.of<CatCarreraProvider>(context, listen: false).getCatCarrera();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final tipCarrProvider =
        Provider.of<CatCarreraProvider>(context, listen: false);
    ScrollController controller =
        ScrollController(keepScrollOffset: true, initialScrollOffset: 0.0);
    controller.createScrollPosition;
    String textini;
    if (widget.edit == false) {
      textini = 'Registrar tipo carrera';
    } else {
      textini = 'Actualizar tipo carera: ${widget.tipcar!.typeName}';
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
              initialValue: widget.tipcar?.typeName ?? typeName,
              onChanged: (value) => typeName = value,
              decoration: CustomInputs.loginInputDecoration(
                  hint: typeName ?? 'Ingrese el nombre del tipo de carrera',
                  label: 'Tipo de Carrera',
                  icon: Icons.new_releases_outlined),
            ),
            TextFormField(
              initialValue: widget.tipcar?.description ?? description,
              onChanged: (value) => description = value,
              decoration: CustomInputs.loginInputDecoration(
                  hint: description ?? 'Ingrese una descripcion',
                  label: 'Descripcion',
                  icon: Icons.new_releases_outlined),
            ),
            Container(
              margin: EdgeInsets.only(top: 30),
              alignment: Alignment.center,
              child: CustomOutlinedButton(
                onPressed: () async {
                  try {
                    if (widget.edit == true) {
                      await tipCarrProvider.updateTipCarr(
                          id, typeName, description);

                      NotificationsService.showSnackbar(
                          '$typeName Actualizado');
                    } else {
                      await tipCarrProvider.newTipoCerrera(
                          typeName, description, id);
                      NotificationsService.showSnackbar('$typeName Creado!');
                    }
                  } catch (e) {
                    NotificationsService.showSnackbar(
                        'No se pudo guardar el evento');
                  }
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Tipos_Carreras_View()),
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
