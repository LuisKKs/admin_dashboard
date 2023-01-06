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
    final correProvider = Provider.of<CorredoresProvider>(context);

    final corredores = Provider.of<CorredoresProvider>(context).corredores;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          Text('Menu De Corredores view', style: CustomLabels.h1),
          SizedBox(height: 10),
          PaginatedDataTable(
            sortAscending: correProvider.ascending,
            sortColumnIndex: correProvider.sortColIndex,
            columns: [
              DataColumn(
                label: Text('Nombre'),
                onSort: (colIndex, _) {
                  correProvider.sortColIndex = colIndex;
                  correProvider.sort<String>((corredor) => corredor.name);
                },
              ),
              DataColumn(
                label: Text('Apellido paterno'),
                onSort: (colIndex, _) {
                  correProvider.sortColIndex = colIndex;
                  correProvider.sort<String>((corredor) => corredor.lastname);
                },
              ),
              DataColumn(
                label: Text('Apellido materno'),
                onSort: (colIndex, _) {
                  correProvider.sortColIndex = colIndex;
                  correProvider.sort<String>((corredor) => corredor.lastname2);
                },
              ),
              DataColumn(
                label: Text('Numero de Corredor'),
                onSort: (colIndex, _) {
                  correProvider.sortColIndex = colIndex;
                  correProvider
                      .sort<String>((corredor) => corredor.runnerNumber);
                },
              ),
              DataColumn(label: Text('Correo')),
              DataColumn(
                label: Text('Pais'),
                onSort: (colIndex, _) {
                  correProvider.sortColIndex = colIndex;
                  correProvider.sort<String>((corredor) => corredor.country);
                },
              ),
              DataColumn(
                label: Text('Estado'),
                onSort: (colIndex, _) {
                  correProvider.sortColIndex = colIndex;
                  correProvider.sort<String>((corredor) => corredor.state);
                },
              ),
              DataColumn(label: Text('Nombre de Emergencia')),
              DataColumn(label: Text('Numero de Emergencia')),
              DataColumn(label: Text('Licencia')),
              DataColumn(
                label: Text('Municipio'),
                onSort: (colIndex, _) {
                  correProvider.sortColIndex = colIndex;
                  correProvider
                      .sort<String>((corredor) => corredor.municipality);
                },
              ),
              DataColumn(label: Text('Telefono')),
              DataColumn(
                label: Text('Fecha de Nacimiento'),
                onSort: (colIndex, _) {
                  correProvider.sortColIndex = colIndex;
                  correProvider.sort<String>(
                      (corredor) => corredor.birthDate.toString());
                },
              ),
              DataColumn(label: Text('Foto')),
              DataColumn(label: Text('Sexo')),
              DataColumn(
                label: Text('Equipo'),
                onSort: (colIndex, _) {
                  correProvider.sortColIndex = colIndex;
                  correProvider.sort<String>((corredor) => corredor.team);
                },
              ),
              DataColumn(label: Text('Asignación de carrera')),
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
