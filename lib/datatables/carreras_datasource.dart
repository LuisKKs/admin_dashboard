import 'package:flutter/material.dart';

import '../models/carrerasprin.dart';

class CarrerasDatasource extends DataTableSource {
  final List<Carrera> carreras;
  final BuildContext context;
  CarrerasDatasource(this.carreras, this.context);

  @override
  DataRow getRow(int index) {
    final carrera = this.carreras[index];

    return DataRow.byIndex(index: index, cells: [
      DataCell(Text(carrera.shortName)),
      DataCell(Text(carrera.longName)),
      DataCell(Text(carrera.raceDate.toString())),
      DataCell(Text(carrera.raceHour)),
      DataCell(Text(carrera.responsable)),
      DataCell(Text(carrera.contactNumber)),
      DataCell(Text(carrera.event.eventName)),
      DataCell(Text(carrera.raceLink)),
      DataCell(Text(carrera.email)),
      DataCell(Text(carrera.location)),
      DataCell(Text(carrera.altitude)),
      DataCell(Text(carrera.latitude)),
      DataCell(Text(carrera.municipality)),
      DataCell(Text(carrera.state)),
      DataCell(Row(
        verticalDirection: VerticalDirection.up,
        children: [
          IconButton(
              icon: Icon(Icons.edit_outlined),
              onPressed: () {
                print('editando: $carrera');
              }),
          IconButton(
              icon: Icon(
                Icons.delete_outlined,
                color: Colors.red.withOpacity(0.8),
              ),
              onPressed: () {
                final dialog = AlertDialog(
                  title: Text('¿Esta seguro de borrarlo?'),
                  content: Text('Borrar definitivamente ${carrera.shortName}?'),
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
  int get rowCount => carreras.length;

  @override
  int get selectedRowCount => 0;
}