import 'package:admin_dashboard/models/evento.dart';
import 'package:flutter/material.dart';

class EventosDatasource extends DataTableSource {
  final List<Evento> eventos;
  EventosDatasource(this.eventos);

  @override
  DataRow getRow(int index) {
    final evento = this.eventos[index];

    return DataRow.byIndex(index: index, cells: [
      DataCell(Text(evento.shortName)),
      DataCell(Text(evento.eventName)),
      DataCell(Text('Cell #3 index:$index')),
      DataCell(Text('Cell #4 index:$index')),
      //DataCell(Text(evento.dateStart)),
      //DataCell(Text(evento.dateFinish)),
      DataCell(Text(evento.eventHour)),
      DataCell(Text(evento.logo)),
      DataCell(Text(evento.organizer)),
      DataCell(Text(evento.email)),
      DataCell(Text(evento.phone)),
      DataCell(Text(evento.website)),
      DataCell(Text(evento.country)),
      DataCell(Text(evento.stateCountry)),
      DataCell(Text('Cell #13 index:$index')),
      DataCell(Text('Cell #14 index:$index')),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => eventos.length;

  @override
  int get selectedRowCount => 0;
}
