import 'package:admin_dashboard/models/corredor.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/carrera_corredores_provider.dart';
import '../../providers/carreras_provider.dart';
import '../../services/notifications_service.dart';
import 'package:admin_dashboard/providers/corredores_provider.dart';
import 'package:admin_dashboard/models/http/corredores_carrera_id_response.dart';
import 'package:admin_dashboard/models/carrerasprin.dart';
import '../labels/custom_labels.dart';
import '../buttons/custom_outlined_button.dart';
import 'package:admin_dashboard/ui/views/menu_corredores_view.dart';

class CarreraCorredoresModal extends StatefulWidget {
  final Result? carrera;
  final ScrollController? controller;
  final bool edit;
  const CarreraCorredoresModal(
      {Key? key, this.controller, required this.edit, this.carrera})
      : super(key: key);

  @override
  State<CarreraCorredoresModal> createState() => _CarreraCorredoresModal();
}

class _CarreraCorredoresModal extends State<CarreraCorredoresModal> {
  String idca = '';
  String race = '';
  @override
  void initState() {
    super.initState();
    idca = widget.carrera!.id;
    race = widget.carrera!.race.longName;
  }
  @override
  void didChangeDependencies() {
    Provider.of<CarrerasProvider>(context).getCarreras();
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    List<String> lista = <String>[];
    final corredorCarreraProvider = Provider.of<CarreraCorredoresProvider>(context, listen: false);
    var carreras = Provider.of<CarrerasProvider>(context).carreras;
    List<Carrera> listona = carreras;
    ScrollController controller =
        ScrollController(keepScrollOffset: true, initialScrollOffset: 0.0);
    controller.createScrollPosition;
    String textini  = 'Editar Corredor de la carrera: ${widget.carrera!.race.longName}';
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
                    value: acon.longName,
                    child: Text('${acon.longName} ${acon.shortName}'));
              }).toList(),
              onChanged: (value) => race = value!,
              hint: Text("Seleccion de carrera"),
            ),
            Container(
              margin: EdgeInsets.only(top: 30),
              alignment: Alignment.center,
              child: CustomOutlinedButton(
                onPressed: () async {
                  try {
                    if (widget.edit == false) {
                      await corredorCarreraProvider.updateCarrCorr(id: idca, race: race);
                      NotificationsService.showSnackbar('Carrera editada');
                    }
                  } catch (e) {
                    NotificationsService.showSnackbar(
                        'Edicion rechazada');
                  }
                  Navigator.pop(
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
