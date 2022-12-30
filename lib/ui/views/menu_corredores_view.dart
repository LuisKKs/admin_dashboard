import 'package:admin_dashboard/datatables/corredores_datasource.dart';
import 'package:admin_dashboard/providers/corredores_provider.dart';
import 'package:admin_dashboard/ui/modals/corredores_modal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../buttons/custom_icon_button.dart';
import '../labels/custom_labels.dart';

class Menu_CorredoresView extends StatefulWidget {
  @override
  State<Menu_CorredoresView> createState() => _Menu_CorredoresViewState();
}

class _Menu_CorredoresViewState extends State<Menu_CorredoresView> {
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;

  @override
  void initState() {
    super.initState();

    Provider.of<CorredoresProvider>(context, listen: false).getCorredores();
  }

  @override
  Widget build(BuildContext context) {
    final corredores = Provider.of<CorredoresProvider>(context).corredores;

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
              DataColumn(label: Text('Apellido paterno')),
              DataColumn(label: Text('Apellido materno')),
              DataColumn(label: Text('Numero de Corredor')),
              DataColumn(label: Text('Correo')),
              DataColumn(label: Text('Pais')),
              DataColumn(label: Text('Estado')),
              DataColumn(label: Text('Nombre de Emergencia')),
              DataColumn(label: Text('Numero de Emergencia')),
              DataColumn(label: Text('Licencia')),
              DataColumn(label: Text('Municipio')),
              DataColumn(label: Text('Telefono')),
              DataColumn(label: Text('Fecha de Nacimiento')),
              DataColumn(label: Text('Foto')),
              DataColumn(label: Text('Sexo')),
              DataColumn(label: Text('Equipo')),
              DataColumn(label: Text('Acciones')),
            ],
            source: CorredoresDatasource(corredores, context),
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
                      builder: (_) => CorredoresModal(
                            edit: false,
                          ));
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
