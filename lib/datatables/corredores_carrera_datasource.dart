import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/services/navigation_service.dart';
import 'package:admin_dashboard/ui/modals/carrera_corredores_modal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/http/corredores_carrera_id_response.dart';
import '../providers/carrera_corredores_provider.dart';

class CorredoresCarreraDatasource extends DataTableSource {
  final List<Result> corredores;
  final BuildContext context;
  CorredoresCarreraDatasource(this.corredores, this.context);
  @override
  
  DataRow getRow(int index) {
    var corredor = corredores[index];
    return DataRow.byIndex(index: index, cells: [
      DataCell(Text(corredor.runner.name)),
      DataCell(Text(corredor.race.longName)),
      DataCell(Row(
        verticalDirection: VerticalDirection.up,
        children: [
          IconButton(
              icon: Icon(Icons.edit_outlined),
              onPressed: () {
                bool edit = true;
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return CarreraCorredoresModal(edit: true, carrera: corredor,);//TipoCarrerasModal(tipcar: tipo, edit: edit);
                    });
              }),
          IconButton(
              icon: Icon(
                Icons.delete_outlined,
                color: Colors.red.withOpacity(0.8),
              ),
              onPressed: () {
                final dialog = AlertDialog(
                  title: Text('¿Esta seguro de borrarlo?'),
                  content: Text('Borrar definitivamente ?'),
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
                        await Provider.of<CarreraCorredoresProvider>(context,
                                listen: false)
                            .deleteCarreraCorredor(corredor.id);
                        NavigationService.replaceTo(Flurorouter.Menu_CarrerasRoute);
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
