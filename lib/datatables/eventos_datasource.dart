import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:admin_dashboard/models/evento.dart';
import 'package:admin_dashboard/providers/eventos_provider.dart';
import '../ui/modals/evento_modal.dart';


class EventosDatasource extends DataTableSource {
  final List<Evento> eventos;
  final BuildContext context;
  EventosDatasource(this.eventos, this.context);

  @override
  DataRow getRow(int index) {
    final evento = eventos[index];
    String start = evento.dateStart.toString();
    String end = evento.dateFinish.toString();
    return DataRow.byIndex(index: index, cells: [
      DataCell(Text(evento.shortName)),
      DataCell(Text(evento.eventName)),
      DataCell(Text(start)),
      DataCell(Text(end)),
      DataCell(Text(evento.eventHour)),
      //DataCell(Text(evento.img)),
      DataCell(Container(
        width: 100,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
                if(evento.img.compareTo('No image given').isEven)
                  Text(evento.img),
                if(evento.img.compareTo('No image given').isOdd)
                  ClipRect(child: FadeInImage.assetNetwork(placeholder: 'loader.gif', image: evento.img))
              ],
          ),
        ),
      )),
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
                bool edit = true;
                showModalBottomSheet(
                    context: context,
                    builder: (context) =>
                        EventoModal(evento: evento, edit: edit));
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
                      onPressed: () async {
                        await Provider.of<EventosProvider>(context,
                                listen: false)
                            .deleteEvento(evento.id);
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
