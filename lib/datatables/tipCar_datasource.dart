import 'package:admin_dashboard/providers/tipo_carrera_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/carrera.dart';
import '../ui/modals/tipo_carreras_modal.dart';

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
      //DataCell(Text(tipo.user.name)),
      DataCell(Text(tipo.description)),
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
                        TipoCarrerasModal(tipcar: tipo, edit: edit));
              }),
          IconButton(
              icon: Icon(
                Icons.delete_outlined,
                color: Colors.red.withOpacity(0.8),
              ),
              onPressed: () {
                final dialog = AlertDialog(
                  title: Text('¿Esta seguro de borrarlo?'),
                  content: Text('Borrar definitivamente ${tipo.typeName}?'),
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
                        await Provider.of<CatCarreraProvider>(context,
                                listen: false)
                            .deleteEvento(tipo.id);
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
