import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../services/notifications_service.dart';
import '../../providers/carreras_provider.dart';
import 'package:admin_dashboard/providers/corredores_provider.dart';
import 'package:admin_dashboard/models/carrerasprin.dart';
import 'package:admin_dashboard/models/corredor.dart';
import 'package:admin_dashboard/ui/views/menu_corredores_view.dart';
import '../labels/custom_labels.dart';
import '../buttons/custom_outlined_button.dart';

class CorredorCarreraModal extends StatefulWidget {
  final Corredore? corredore;
  final ScrollController? controller;
  final bool edit;
  const CorredorCarreraModal(
      {Key? key, this.corredore, this.controller, required this.edit})
      : super(key: key);

  @override
  State<CorredorCarreraModal> createState() => _CorredorCarreraModal();
}

class _CorredorCarreraModal extends State<CorredorCarreraModal> {
  String idca = '';
  String idco = '';
  

  @override
  void initState() {
    super.initState();
    idco = widget.corredore!.id;
    Provider.of<CarrerasProvider>(context, listen: false).getCarreras();
    
  }
  //@override
  //void didChangeDependencies() {
  //  super.didChangeDependencies();
  //}

  @override
  Widget build(BuildContext context) {
    List<String> lista = <String>[];
    final corredorCarreraProvider =
        Provider.of<CorredoresProvider>(context, listen: false);
    var carrera = Provider.of<CarrerasProvider>(context).carreras;
    List<Carrera> listona = carrera;
    ScrollController controller =
        ScrollController(keepScrollOffset: true, initialScrollOffset: 0.0);
    controller.createScrollPosition;
    String textini  = 'Asignar carrera';
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
                    value: acon.id,
                    child: Text(acon.longName));
              }).toList(),
              onChanged: (value) => idca = value!,
              hint: Text("Seleccion de carrera"),
            ),
            Container(
              margin: EdgeInsets.only(top: 30),
              alignment: Alignment.center,
              child: CustomOutlinedButton(
                onPressed: () async {
                  try {
                    if (widget.edit == false) {
                      await corredorCarreraProvider.corredorCarrera(
                        idco,
                        idca
                      );
                      NotificationsService.showSnackbar('Carrera asignada');
                    }
                  } catch (e) {
                    NotificationsService.showSnackbar(
                        'Asignacion rechazada');
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
