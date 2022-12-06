import 'package:admin_dashboard/providers/tipo_carrera_provider.dart';
import 'package:admin_dashboard/ui/buttons/custom_icon_button.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:admin_dashboard/ui/modals/evento_modal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../datatables/tipCar_datasource.dart';

class Tipos_Carreras extends StatefulWidget {
  @override
  State<Tipos_Carreras> createState() => _Tipos_CarrerasState();
}

class _Tipos_CarrerasState extends State<Tipos_Carreras> {
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;

  @override
  void initState() {
    super.initState();

    Provider.of<CatCarreraProvider>(context, listen: false).getCatCarrera();
  }

  @override
  Widget build(BuildContext context) {
    final tipos = Provider.of<CatCarreraProvider>(context).racetypes;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          Text('Tipos de carreras view', style: CustomLabels.h1),
          SizedBox(height: 10),
          PaginatedDataTable(
            columns: [
              DataColumn(label: Text('Nombre')),
              DataColumn(label: Text('Usuario')),
              DataColumn(label: Text('Descripcion')),
            ],
            source: TipCarDatasource(tipos, context),
            header: Text('Eventos Disponibles', maxLines: 2),
            onRowsPerPageChanged: (value) {
              setState(() {
                _rowsPerPage = value ?? 10;
              });
            },
            rowsPerPage: _rowsPerPage,
            actions: [
              CustomIconButton(
                onPressed: () {
                  showModalBottomSheet(
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (_) => EventoModal());
                },
                text: 'Crear',
                icon: Icons.add_outlined,
              )
            ],
          )
        ],
      ),
    );
  }
}
