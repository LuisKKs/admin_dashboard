import 'package:admin_dashboard/models/corredor.dart';
import 'package:flutter/material.dart';

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
      DataCell(Text(corredor.runnerNumber.toString())),
      DataCell(Text(corredor.email)),
      DataCell(Text(corredor.country)),
      DataCell(Text(corredor.emergencyName)),
      DataCell(Text(corredor.emergencyNumber)),
      DataCell(Text(corredor.licence)),
      DataCell(Text(corredor.municipality)),
      DataCell(Text(corredor.phoneNumber)),
      DataCell(Text(corredor.birthDate.toString())),
      DataCell(Text(corredor.picture)),
      DataCell(Text(corredor.sex)),
      DataCell(Text(corredor.team)),
      DataCell(Row(
        verticalDirection: VerticalDirection.up,
        children: [
          IconButton(
              icon: Icon(Icons.edit_outlined),
              onPressed: () {
                print('editando: $corredor');
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
                      onPressed: () {
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
