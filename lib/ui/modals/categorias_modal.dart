import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../services/notifications_service.dart';
import 'package:admin_dashboard/providers/categorias_provider.dart';
import 'package:admin_dashboard/providers/tipo_carrera_provider.dart';
import '../../models/carrera.dart';
import '../../models/categorias.dart';
import 'package:admin_dashboard/ui/views/categorias_view.dart';
import '../inputs/custom_inputs.dart';
import '../labels/custom_labels.dart';
import '../buttons/custom_outlined_button.dart';

class CategoriaModal extends StatefulWidget {
  final Categorias? categoria;
  final bool edit;
  const CategoriaModal({Key? key, required this.edit, this.categoria})
      : super(key: key);

  @override
  State<CategoriaModal> createState() => _CategoriaModalState();
}

class _CategoriaModalState extends State<CategoriaModal> {
  late String id;
  late String raceType;
  late String categoryName;
  late String branch;
  late String description;

  @override
  void initState() {
    super.initState();
    id = widget.categoria?.id ?? '';
    raceType = widget.categoria?.raceType.typeName ?? '';
    categoryName = widget.categoria?.categoryName ?? '';
    branch = widget.categoria?.branch ?? '';
    description = widget.categoria?.description ?? '';
    Provider.of<CatCarreraProvider>(context, listen: false).getCatCarrera();
  }

  //@override
 //void didChangeDependencies() {
 //  Provider.of<CatCarreraProvider>(context, listen: false).getCatCarrera();
 //  super.didChangeDependencies();
 //}

  @override
  Widget build(BuildContext context) {
    final catProv = Provider.of<CategoriasProvider>(context, listen: false);
    var carrera = Provider.of<CatCarreraProvider>(context).racetypes;
    List<Racetype> listona = carrera;
    ScrollController controller =
        ScrollController(keepScrollOffset: true, initialScrollOffset: 0.0);
    controller.createScrollPosition;
    String textini;
    if (widget.edit == false) {
      textini = 'Registrar categoria';
    } else {
      textini = 'Actualizar categoria: ${widget.categoria!.categoryName}';
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
              onChanged: (value) => raceType = value!,
              hint: Text("Seleccione el tipo de carrera"),
            ),
            TextFormField(
              initialValue: widget.categoria?.categoryName ?? categoryName,
              onChanged: (value) => categoryName = value,
              decoration: CustomInputs.loginInputDecoration(
                hint: categoryName ?? 'Ingrese el nombre de la categoria',
                label: 'Categoria',
                icon: Icons.catching_pokemon_outlined,
              ),
            ),
            TextFormField(
              initialValue: widget.categoria?.branch ?? branch,
              onChanged: (value) => branch = value,
              decoration: CustomInputs.loginInputDecoration(
                hint: branch ?? 'Rama de la categoría',
                label: 'Rama',
                icon: Icons.class_outlined,
              ),
            ),
            TextFormField(
              initialValue: widget.categoria?.description ?? description,
              onChanged: (value) => description = value,
              decoration: CustomInputs.loginInputDecoration(
                hint: description ?? 'Descripcion de la categoría',
                label: 'Descripcion',
                icon: Icons.description_outlined,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30),
              alignment: Alignment.center,
              child: CustomOutlinedButton(
                onPressed: () async {
                  try {
                    if (widget.edit == true) {
                      await catProv.updateCategoria(
                        id,
                        raceType,
                        categoryName,
                        branch,
                        description,
                      );
                      NotificationsService.showSnackbar(
                          '$categoryName Actualizado!');
                    } else {
                      await catProv.newCategoria(
                        //id ,
                        raceType,
                        categoryName,
                        branch,
                        description,
                      );
                      NotificationsService.showSnackbar(
                          '$categoryName Creado!');
                    }
                  } catch (e) {
                    NotificationsService.showSnackbarError(
                        'No se pudo guardar la categoria');
                  }
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => CategoriasView()),
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
