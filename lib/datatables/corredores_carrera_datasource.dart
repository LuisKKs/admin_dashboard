import 'package:flutter/material.dart';
import 'package:admin_dashboard/models/http/corredores_carrera_response.dart';

class CorredoresCarreraDatasource extends DataTableSource {
  final List<CorredoresCarreraElement> corredores;
  final String id;
  final BuildContext context;
  CorredoresCarreraDatasource(this.id, this.corredores, this.context);
  @override
  
  DataRow getRow(int index) {
    CorredoresCarreraElement corredor = corredores[index];
    return DataRow.byIndex(index: index, cells: [
      DataCell(Text(corredor.runner.name)),
      DataCell(Text(corredor.race.longName)),
      DataCell(Row(
        verticalDirection: VerticalDirection.up,
        children: [
          IconButton(
              icon: Icon(Icons.edit_outlined),
              onPressed: () {
              }),
          IconButton(
              icon: Icon(
                Icons.delete_outlined,
                color: Colors.red.withOpacity(0.8),
              ),
              onPressed: () {
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
