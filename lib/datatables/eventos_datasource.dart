import 'package:admin_dashboard/models/evento.dart';
import 'package:flutter/material.dart';

class EventosDatasource extends DataTableSource {
  final List<Evento> eventos;
  EventosDatasource(this.eventos);

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
      DataCell(Text(evento.raceType.typeName)),
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
