import 'package:admin_dashboard/providers/carreras_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../datatables/carreras_datasource.dart';
import '../buttons/custom_icon_button.dart';
import '../labels/custom_labels.dart';
import '../modals/evento_modal.dart';

class Menu_CarrerasView extends StatefulWidget {
  @override
  State<Menu_CarrerasView> createState() => _Menu_CarrerasViewState();
}

class _Menu_CarrerasViewState extends State<Menu_CarrerasView> {
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;

  @override
  void initState() {
    super.initState();

    Provider.of<CarrerasProvider>(context, listen: false).getCarreras();
  }

  @override
  Widget build(BuildContext context) {
    final carreras = Provider.of<CarrerasProvider>(context).carreras;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          Text('Menu De Corredores view', style: CustomLabels.h1),
          SizedBox(height: 10),
          PaginatedDataTable(
            columns: [
              DataColumn(label: Text('Nombre')),
              DataColumn(label: Text('Siglas')),
              DataColumn(label: Text('Fecha')),
              DataColumn(label: Text('Hora')),
              DataColumn(label: Text('Responsable')),
              DataColumn(label: Text('Numero de Contacto')),
              DataColumn(label: Text('Evento')),
              DataColumn(label: Text('Link')),
              DataColumn(label: Text('email')),
              DataColumn(label: Text('Localizacion')),
              DataColumn(label: Text('Altitud')),
              DataColumn(label: Text('Latitud')),
              DataColumn(label: Text('Municipio')),
              DataColumn(label: Text('Estado')),
              DataColumn(label: Text('Acciones')),
            ],
            source: CarrerasDatasource(carreras, context),
            header: Text('Corredores Disponibles', maxLines: 2),
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
