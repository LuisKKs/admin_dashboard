import 'package:flutter/material.dart';

import '../models/carrera.dart';

class TipCarDatasource extends DataTableSource {
  final List<Racetype> racetypes;
  final BuildContext context;
  TipCarDatasource(this.racetypes, this.context);

  @override
  DataRow getRow(int index) {
    final tipo = this.racetypes[index];
    // String start = evento.dateStart.toString();
    // String end = evento.dateFinish.toString();
    return DataRow.byIndex(index: index, cells: [
      DataCell(Text(tipo.typeName)),
      DataCell(Text(tipo.user.name)),
      DataCell(Text(tipo.description)),
      DataCell(Row(
        verticalDirection: VerticalDirection.up,
        children: [
          IconButton(
              icon: Icon(Icons.edit_outlined),
              onPressed: () {
                print('editando: $tipo');
              }),
          IconButton(
              icon: Icon(
                Icons.delete_outlined,
                color: Colors.red.withOpacity(0.8),
              ),
              onPressed: () {
                final dialog = AlertDialog(
                  title: Text('¿Esta seguro de borrarlo?'),
                  content: Text('Borrar definitivamente ${tipo.user.id}?'),
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
  int get rowCount => racetypes.length;

  @override
  int get selectedRowCount => 0;
}
