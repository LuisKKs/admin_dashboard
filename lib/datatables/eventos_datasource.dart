import 'package:admin_dashboard/models/evento.dart';
import 'package:flutter/material.dart';

class EventosDatasource extends DataTableSource {
  final List<Evento> eventos;
  final BuildContext context;
  EventosDatasource(this.eventos, this.context);

  @override
  DataRow getRow(int index) {
    final evento = this.eventos[index];
    String start = evento.dateStart.toString();
    String end = evento.dateFinish.toString();
    return DataRow.byIndex(index: index, cells: [
      DataCell(Text(evento.shortName)),
      DataCell(Text(evento.eventName)),
      DataCell(Text(start)),
      DataCell(Text(end)),
      DataCell(Text(evento.eventHour)),
      DataCell(Text(evento.logo)),
      DataCell(Text(evento.organizer)),
      DataCell(Text(evento.email)),
      DataCell(Text(evento.phone)),
      DataCell(Text(evento.website)),
      DataCell(Text(evento.country)),
      DataCell(Text(evento.stateCountry)),
      DataCell(Text(evento.raceType.typeName)),
      DataCell(Row(
        children: [
          IconButton(
              icon: Icon(Icons.edit_outlined),
              onPressed: () {
                print('editando: $evento');
              }),
          IconButton(
              icon: Icon(
                Icons.delete_outlined,
                color: Colors.red.withOpacity(0.8),
              ),
              onPressed: () {
                final dialog = AlertDialog(
                  title: Text('¿Esta seguro de borrarlo?'),
                  content: Text('Borrar definitivamente ${evento.eventName}?'),
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
  int get rowCount => eventos.length;

  @override
  int get selectedRowCount => 0;
}
