import 'package:admin_dashboard/models/corredor.dart';
import 'package:admin_dashboard/providers/corredores_provider.dart';
import 'package:admin_dashboard/ui/modals/corredor_carrera_modal.dart';
import 'package:admin_dashboard/ui/modals/corredores_modal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/navigation_service.dart';

class CorredoresDatasource extends DataTableSource {
  final List<Corredore> corredores;
  final BuildContext context;
  CorredoresDatasource(this.corredores, this.context);

  @override
  DataRow getRow(int index) {
    final corredor = this.corredores[index];

    return DataRow.byIndex(index: index, cells: [
      DataCell(Text(corredor.name)),
      DataCell(Text(corredor.lastname)),
      DataCell(Text(corredor.lastname2)),
      DataCell(Text(corredor.runnerNumber)),
      DataCell(Text(corredor.email)),
      DataCell(Text(corredor.country)),
      DataCell(Text(corredor.state)),
      DataCell(Text(corredor.emergencyName)),
      DataCell(Text(corredor.emergencyNumber)),
      DataCell(Text(corredor.licence)),
      DataCell(Text(corredor.municipality)),
      DataCell(Text(corredor.phoneNumber)),
      DataCell(Text(corredor.birthDate.toString())),
      DataCell(Text(corredor.picture)),
      DataCell(Text(corredor.sex)),
      DataCell(Text(corredor.team)),
      DataCell(IconButton(
        icon: Icon(Icons.assignment_ind_outlined),
        onPressed: () {
          bool edit = false;
          showModalBottomSheet(
              context: context,
              builder: (context) =>
                  CorredorCarreraModal(corredore: corredor, edit: edit));
        }
      )),
      DataCell(Row(
        verticalDirection: VerticalDirection.up,
        children: [
          IconButton(
              icon: Icon(Icons.edit_outlined),
              onPressed: () {
                bool edit = true;
                showModalBottomSheet(
                    context: context,
                    builder: (context) =>
                        CorredoresModal(corredore: corredor, edit: edit));
              }),
          IconButton(
              icon: Icon(
                Icons.delete_outlined,
                color: Colors.red.withOpacity(0.8),
              ),
              onPressed: () {
                final dialog = AlertDialog(
                  title: Text('¿Esta seguro de borrarlo?'),
                  content: Text('Borrar definitivamente ${corredor.name}?'),
                  actions: [
                    TextButton(
                      child: Text('No'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    TextButton(
                      child: Text('Si, borrar'),
                      onPressed: () async {
                        await Provider.of<CorredoresProvider>(context,
                                listen: false)
                            .deleteCorredor(corredor.id);
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );

                showDialog(context: context, builder: (_) => dialog);
              }),
        ],
      )),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => corredores.length;

  @override
  int get selectedRowCount => 0;
}
